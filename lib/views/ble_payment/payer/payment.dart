import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ble_lib/flutter_ble_lib.dart';
import 'package:get/get.dart';
import 'package:more/tuple.dart';
import 'package:optional/optional.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/views/ble_payment/common/command.dart';
import 'package:tw_wallet_ui/views/ble_payment/payer/session.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';

import 'payee.dart';

enum PaymentProgress {
  connecting,
  waitUserConnect,
  askInfo,
  waitUserConfirm,
  waitPaymentConfirm,
  success,
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

  const Payment(this._bleDevice);

  @override
  State<StatefulWidget> createState() => _PaymentState();
}

extension CharacteristicExtension on Characteristic {
  Future<void> writeCommand(Command command) {
    return write(command.encode(), true);
  }
}

class _PaymentState extends State<Payment> {
  Characteristic _readCharacteristic;
  Characteristic _writeCharacteristic;
  StreamSubscription _dataMonitor;
  final Rx<PaymentProgress> _paymentProgress = Rx(PaymentProgress.unknown);
  final RxString _hintText = RxString('');

  Future<Optional<Tuple2<Characteristic, Characteristic>>> discovery() async {
    await widget._bleDevice.peripheral.discoverAllServicesAndCharacteristics();

    final Service service = await widget._bleDevice.peripheral.services().then(
        (services) => services.firstWhere(
            (service) => service.uuid == "36efb2e4-8711-4852-b339-c6b5dac518e0",
            orElse: () => null));

    if (null == service) {
      return const Optional.empty();
    }

    final List<Characteristic> characteristics =
        await service.characteristics();

    _readCharacteristic = characteristics.firstWhere((characteristic) =>
        characteristic.uuid == "0ac637b0-9c14-4741-8f9f-b0baae77d0b4");

    _writeCharacteristic = characteristics.firstWhere((characteristic) =>
        characteristic.uuid == "4fec0357-2493-4901-b1a2-9e2ec21b9676");

    if (_readCharacteristic == null || _writeCharacteristic == null) {
      return const Optional.empty();
    }

    return Optional.of(Tuple2(_readCharacteristic, _writeCharacteristic));
  }

  Future<void> _doDisconnect() async {
    if (null != _dataMonitor) {
      await _dataMonitor.cancel();
    }

    if (await widget._bleDevice.isConnected()) {
      await widget._bleDevice.disconnect();
    }
  }

  Future<void> _doConnect() async {
    // try {
    await widget._bleDevice.connect().then((_) => discovery().then((res) =>
        res.ifPresent(
            (characteristics) =>
                Session(characteristics.first, characteristics.second)
                    .negotiateAesKey(),
            orElse: () =>
                _paymentProgress.value = PaymentProgress.notSupported)));
//    } catch (e) {
//      print('e: $e');
//      _paymentProgress.value = PaymentProgress.waitUserConnect;
//    }
  }

  Widget _buildButton() {
    switch (_paymentProgress.value) {
      case PaymentProgress.waitUserConfirm:
        return WalletTheme.button(
            text: '确认付款',
            onPressed: () async {
              _paymentProgress.value = PaymentProgress.waitPaymentConfirm;
            });

      case PaymentProgress.waitUserConnect:
        return WalletTheme.button(text: '重新连接', onPressed: () => _doConnect());

      case PaymentProgress.success:
        return WalletTheme.button(
            text: '结束付款',
            onPressed: () => Get.back(result: widget._bleDevice.name));

      default:
        return Container();
    }
  }

  @override
  void initState() {
    super.initState();
    widget._bleDevice.connectionState.listen((state) {
      if (state == PeripheralConnectionState.connecting) {
        _paymentProgress.value = PaymentProgress.connecting;
      }
    });
    _paymentProgress.listen((value) {
      if (value == PaymentProgress.connecting) {
        _hintText.value = value.description();
      } else {
        _hintText.value += '\n${value.description()}';
      }
    });
    _doConnect();
  }

  @override
  void dispose() {
    _doDisconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => CommonLayout(
        title: widget._bleDevice.name,
        bodyBackColor: WalletColor.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
            Expanded(
                child: Center(
              child: Text(
                _hintText.value,
                textAlign: TextAlign.center,
              ),
            )),
            _buildButton()
          ]),
        )));
  }
}