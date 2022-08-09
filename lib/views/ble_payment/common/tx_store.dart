import 'dart:collection';

import 'dart:isolate';

import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:json_store/json_store.dart';
import 'package:quick_log/quick_log.dart';
import 'package:tw_wallet_ui/common/device_info.dart';
import 'package:tw_wallet_ui/models/offline_tx/offline_tx.dart';
import 'package:tw_wallet_ui/service/api_provider.dart';

const offlineTxPrefix = 'offlineTx';

class OfflineTxStore {
  final SendPort _sendPort;
  final Connectivity _connectivity;
  final Rx<Queue<TxReceive?>> txQueue;

  static final JsonStore _store = JsonStore();

  OfflineTxStore(this._sendPort, this.txQueue, this._connectivity) {
    if (txQueue.value.isNotEmpty) {
      Future.delayed(const Duration(seconds: 2))
          .then((_) => _sendPort.send(txQueue.value.first));
    }

    _connectivity.onConnectivityChanged.listen((res) {
      if (res != ConnectivityResult.none) {
        if (txQueue.value.isNotEmpty) {
          for (final TxReceive? tx in txQueue.value) {
            _sendPort.send(tx);
          }
        }
      }
    });
  }

  static String _itemKey(TxReceive tx) {
    return '$offlineTxPrefix: $tx.from';
  }

  static Future<OfflineTxStore> init() async {
    final Queue<TxReceive?> txQueue = Queue();
    final ReceivePort receivePort = ReceivePort();
    final Connectivity connectivity = Connectivity();
    const Logger log = Logger('offlineTxStore');

    receivePort.listen((tx) async {
      if (!DeviceInfo.isPhysicalDevice ||
          ConnectivityResult.none != await connectivity.checkConnectivity()) {
        final TxReceive offlineTx = tx as TxReceive;
        try {
          await Get.find<ApiProvider>().transferDcepV2(
            offlineTx.from,
            offlineTx.publicKey,
            offlineTx.tx,
          );
        } catch (e) {
          log.error('offlineTx transfer error: $e');
        }

        await _store.deleteItem(_itemKey(offlineTx));
        txQueue.remove(tx);
      }
    });

    await _store.getListLike('$offlineTxPrefix: %').then((list) {
      if (null != list && list.isNotEmpty) {
        txQueue.addAll(
          list.map((item) => TxReceive.fromJson(item)).whereType<TxReceive>(),
        );
      }
    });

    return OfflineTxStore(receivePort.sendPort, Rx(txQueue), connectivity);
  }

  Future<void> addOne(TxReceive tx) async {
    await _store.setItem(_itemKey(tx), tx.toJson()).then((_) async {
      txQueue.value.add(tx);
      txQueue.refresh();
      if (ConnectivityResult.none != await _connectivity.checkConnectivity()) {
        _sendPort.send(tx);
      }
    });
  }
}
