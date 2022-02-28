import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_ble_lib/flutter_ble_lib.dart';
import 'package:get/get.dart';
import 'package:more/tuple.dart';
import 'package:optional/optional.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/models/dcep/dcep.dart';
import 'package:tw_wallet_ui/models/identity/decentralized_identity.dart';
import 'package:tw_wallet_ui/models/offline_tx/offline_tx.dart';
import 'package:tw_wallet_ui/store/dcep/dcep_store.dart';
import 'package:tw_wallet_ui/views/ble_payment/common/command.dart';
import 'package:tw_wallet_ui/views/ble_payment/payer/payee.dart';
import 'package:tw_wallet_ui/views/ble_payment/payer/session.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';
import 'package:web3dart/crypto.dart';

enum PaymentProgress {
  connecting,
  waitUserConnect,
  askInfo,
  waitUserConfirm,
  waitPaymentConfirm,
  fail,
  success,
  balanceNotEnough,
  notSupported,
  unknown,
}

extension PaymentProgressExtension on PaymentProgress {
  String description() {
    switch (this) {
      case PaymentProgress.connecting:
        return '连接中';
      case PaymentProgress.waitUserConnect:
        return '等待用户重连';
      case PaymentProgress.askInfo:
        return '询问付款信息';
      case PaymentProgress.waitUserConfirm:
        return '等待用户确认';
      case PaymentProgress.waitPaymentConfirm:
        return '等待付款确认';
      case PaymentProgress.success:
        return '付款成功';
      case PaymentProgress.notSupported:
        return '对端不支持';
      case PaymentProgress.unknown:
        return '未知错误';
      default:
        return '';
    }
  }
}

class Payment extends StatefulWidget {
  final Payee _bleDevice;
  final DecentralizedIdentity _identity;

  const Payment(this._bleDevice, this._identity);

  @override
  State<StatefulWidget> createState() => _PaymentState();
}

extension CharacteristicExtension on Characteristic {
  Future<void> writeCommand(Command command) {
    return write(command.encode(), true);
  }
}

class _PaymentState extends State<Payment> {
  final RxInt _amount = 0.obs;
  final RxString _hintText = RxString('');
  final Completer<bool> _confirmCompleter = Completer();
  final DcepStore _dcepStore = Get.find<DcepStore>();
  final Rx<PaymentProgress> _paymentProgress = Rx(PaymentProgress.connecting);

  late StreamSubscription _dataMonitor;
  late Characteristic _readCharacteristic;
  late Characteristic _writeCharacteristic;

  Future<Optional<Tuple2<Characteristic, Characteristic>>> discovery() async {
    await widget._bleDevice.peripheral.discoverAllServicesAndCharacteristics();

    final Service service = await widget._bleDevice.peripheral.services().then(
          (services) => services.firstWhere(
            (service) => service.uuid == "36efb2e4-8711-4852-b339-c6b5dac518e0",
            orElse: () => null!,
          ),
        );

    if (null == service) {
      return const Optional.empty();
    }

    final List<Characteristic> characteristics =
        await service.characteristics();

    _readCharacteristic = characteristics.firstWhere(
      (characteristic) =>
          characteristic.uuid == "0ac637b0-9c14-4741-8f9f-b0baae77d0b4",
    );

    _writeCharacteristic = characteristics.firstWhere(
      (characteristic) =>
          characteristic.uuid == "4fec0357-2493-4901-b1a2-9e2ec21b9676",
    );

    if (_writeCharacteristic == null) {
      return const Optional.empty();
    }

    return Optional.of(Tuple2(_readCharacteristic, _writeCharacteristic));
  }

  Future<void> _doCleanup() async {
    if (!_confirmCompleter.isCompleted) {
      _confirmCompleter.complete(false);
    }

    await _dataMonitor.cancel();

    if (await widget._bleDevice.isConnected()) {
      await widget._bleDevice.disconnect();
    }
  }

  List<Dcep> _selectDcep(int destAmount, List<Dcep> dcepList) {
    int temp = 0;
    final List<Dcep> selectList = [];

    for (final Dcep dcep in dcepList) {
      if (dcep.amount <= destAmount && (temp + dcep.amount <= destAmount)) {
        temp += dcep.amount;
        selectList.add(dcep);
      }

      if (temp == destAmount) {
        break;
      }
    }

    if (temp == destAmount) {
      return selectList;
    } else {
      return selectList..clear();
    }
  }

  Future<Optional<List<TxSend>>> _onWaitSignPayment(
      String toAddress, int amount) async {
    _amount.value = amount;

    if (await _confirmCompleter.future) {
      final List<Dcep> dcepList =
          _selectDcep(amount * 100, _dcepStore.sortedItems);

      if (dcepList.isNotEmpty) {
        final List<TxSend> txList = [];
        for (final Dcep dcep in dcepList) {
          final BigInt sn = bytesToInt(Uint8List.fromList(dcep.sn.codeUnits));
          final String signedRawTx = await widget._identity
              .signOfflinePayment(sn, toAddress, _dcepStore.nonce);

          _dcepStore.nonce++;
          _dcepStore.remove(dcep);

          txList.add(
            TxSend(
              (builder) => builder
                ..dcep = dcep.toBuilder()
                ..signedRawTx = signedRawTx,
            ),
          );
        }
        return Optional.of(txList);
      } else {
        _paymentProgress.value = PaymentProgress.balanceNotEnough;
      }
    }

    return const Optional.empty();
  }

  void _onStateUpdate(SessionState state) {
    switch (state) {
      case SessionState.waitUserConfirm:
        _paymentProgress.value = PaymentProgress.waitUserConfirm;
        break;

      case SessionState.fail:
        _paymentProgress.value = PaymentProgress.fail;
        break;

      case SessionState.success:
        _paymentProgress.value = PaymentProgress.success;
        break;
      default:
        break;
    }

    _hintText.value += '\n${state.description()}';
  }

  void _doConnect() {
    widget._bleDevice.connect().then(
          (_) => discovery().then((res) {
            res.ifPresent(
              (characteristics) => Session(
                widget._identity.address,
                widget._identity.accountInfo.pubKey,
                characteristics.first,
                characteristics.second,
              ).run(_onWaitSignPayment, _onStateUpdate),
              orElse: () =>
                  _paymentProgress.value = PaymentProgress.notSupported,
            );
          }),
        );
  }

  Widget _buildButton() {
    switch (_paymentProgress.value) {
      case PaymentProgress.waitUserConfirm:
        return WalletTheme.button(
          text: '确认付款 ${_amount.value}',
          onPressed: () async {
            _confirmCompleter.complete(true);
            _paymentProgress.value = PaymentProgress.waitPaymentConfirm;
          },
        );

      case PaymentProgress.balanceNotEnough:
        return WalletTheme.button(
          text: '余额不足，结束转账',
          onPressed: () => Get.back(),
        );
        break;

      case PaymentProgress.waitUserConnect:
        return WalletTheme.button(text: '重新连接', onPressed: () => _doConnect());

      case PaymentProgress.fail:
      case PaymentProgress.success:
        return WalletTheme.button(
          text: '结束付款',
          onPressed: () async {
            await _doCleanup().then(
              (_) => Get.until(
                (route) =>
                    (route as GetPageRoute).routeName == '/BlePaymentHome',
              ),
            );
          },
        );

      default:
        return Container();
    }
  }

  @override
  void initState() {
    super.initState();
    widget._bleDevice.connectionState.listen((state) {
      if (state == PeripheralConnectionState.connecting) {
        _hintText.value = '连接中';
      }
    });
    _doConnect();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CommonLayout(
        title: widget._bleDevice.name,
        bodyBackColor: WalletColor.white,
        beforeDispose: _doCleanup,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Text(
                    _hintText.value,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              _buildButton()
            ],
          ),
        ),
      ),
    );
  }
}
