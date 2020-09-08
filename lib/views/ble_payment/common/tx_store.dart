import 'dart:collection';

import 'dart:isolate';

import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:json_store/json_store.dart';
import 'package:tw_wallet_ui/common/device_info.dart';
import 'package:tw_wallet_ui/models/offline_tx/offline_tx.dart';
import 'package:tw_wallet_ui/service/api_provider.dart';

const offlineTxPrefix = 'offlineTx';

class OfflineTxStore {
  final SendPort _sendPort;
  final Queue<OfflineTx> _txQueue;
  final Connectivity _connectivity;

  static final JsonStore _store = JsonStore();

  OfflineTxStore(this._sendPort, this._txQueue, this._connectivity) {
    if (_txQueue.isNotEmpty) {
      Future.delayed(const Duration(seconds: 2))
          .then((_) => _sendPort.send(_txQueue.first));
    }

    _connectivity.onConnectivityChanged.listen((res) {
      if (res != ConnectivityResult.none) {
        if (_txQueue.isNotEmpty) {
          _sendPort.send(_txQueue.first);
        }
      }
    });
  }

  static Future<OfflineTxStore> init() async {
    final Queue<OfflineTx> _txQueue = Queue();
    final ReceivePort receivePort = ReceivePort();
    final Connectivity _connectivity = Connectivity();

    receivePort.listen((tx) async {
      if (!DeviceInfo.isPhysicalDevice ||
          ConnectivityResult.none != await _connectivity.checkConnectivity()) {
        final OfflineTx offlineTx = tx as OfflineTx;
        Get.find<ApiProvider>()
            .transferDcepV2(offlineTx.from, offlineTx.publicKey, offlineTx.tx)
            .then((_) => _txQueue.remove(tx));
      }
    });

    await _store.getListLike('$offlineTxPrefix: %').then((list) {
      if (null != list && list.isNotEmpty) {
        _txQueue.addAll(list.map((item) => OfflineTx.fromJson(item)));
      }
    });

    return OfflineTxStore(receivePort.sendPort, _txQueue, _connectivity);
  }

  Future<void> addOne(OfflineTx tx) async {
    await _store
        .setItem('$offlineTxPrefix: $tx.from', tx.toJson())
        .then((_) async {
      _txQueue.add(tx);
      if (ConnectivityResult.none != await _connectivity.checkConnectivity()) {
        _sendPort.send(tx);
      }
    });
  }
}
