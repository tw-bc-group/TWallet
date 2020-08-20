import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_ble_lib/flutter_ble_lib.dart';
import 'package:get/get.dart';
import 'package:more/tuple.dart';
import 'package:optional/optional.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';

import '../command.dart';
import 'payee.dart';

enum PaymentProgress {
  askAmount,
  waitConfirm,
  askPayment,
  waitPaymentConfirm,
  success,
  unknown,
}

class Payment extends StatefulWidget {
  final Payee _bleDevice;

  const Payment(this._bleDevice);

  @override
  State<StatefulWidget> createState() => _PaymentState();
}

extension CharacteristicExtension on Characteristic {
  Future<void> writeString(String value) {
    return write(Uint8List.fromList(value.codeUnits), true);
  }
}

class _PaymentState extends State<Payment> {
  double _amount = 0;
  String _lastCommand = '';
  Characteristic _readCharacteristic;
  Characteristic _writeCharacteristic;
  final Rx<PaymentProgress> _paymentProgress = Rx(PaymentProgress.unknown);
  final RxString _hintText = RxString('');

  Future<Optional<Tuple2<Characteristic, Characteristic>>> discovery() async {
    await widget._bleDevice.peripheral.discoverAllServicesAndCharacteristics();

    final Service service = await widget._bleDevice.peripheral.services().then(
        (services) => services.firstWhere((service) =>
            service.uuid == "36efb2e4-8711-4852-b339-c6b5dac518e0"));

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

  void _appendProgress(String text) {
    _hintText.value = '${_hintText.value}\n$text';
  }

  Future<void> _doPayment(
      Characteristic _readCharacteristic, Characteristic _writeCharacteristic) {
    _paymentProgress.value = PaymentProgress.askAmount;
    _writeCharacteristic.writeString(askAmount);
    _appendProgress('询问金额...');

    _readCharacteristic.monitor().listen((data) {
      final String command = String.fromCharCodes(data);
      if (_lastCommand == command) {
        return;
      }
      _lastCommand = command;

      switch (_paymentProgress.value) {
        case PaymentProgress.askAmount:
          if (command.startsWith(answerAmount)) {
            final String amount = command.split(':')[1];
            _appendProgress('付款金额为 $amount');
            _amount = double.parse(amount);
            _paymentProgress.value = PaymentProgress.waitConfirm;
          }
          break;

        case PaymentProgress.waitPaymentConfirm:
          if (command.startsWith(answerPayment)) {
            final String amount = command.split(':')[1];
            if (double.parse(amount) == _amount) {
              _appendProgress('付款成功');
            }
            _paymentProgress.value = PaymentProgress.success;
          }
          break;

        default:
          break;
      }
    });

    return Future.value();
  }

  @override
  void initState() {
    super.initState();
    widget._bleDevice.connect();
    widget._bleDevice.connectionState.listen((state) {
      if (state == PeripheralConnectionState.connected) {
        discovery().then((res) {
          res.ifPresent(
              (characteristics) =>
                  _doPayment(characteristics.first, characteristics.second),
              orElse: () => widget._bleDevice
                  .disconnect()
                  .then((_) => widget._bleDevice.connect()));
        });
      }
    });
  }

  @override
  void dispose() {
    widget._bleDevice.disconnect();
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
                child: Text(
              _hintText.value,
              textAlign: TextAlign.center,
            )),
            if (_paymentProgress.value == PaymentProgress.waitConfirm)
              WalletTheme.button(
                  text: '确认付款',
                  onPressed: () async {
                    _paymentProgress.value = PaymentProgress.askPayment;
                    _appendProgress('付款中...');
                    await _writeCharacteristic
                        .writeString('$askPayment:$_amount');
                    _appendProgress('付款确认中...');
                    _paymentProgress.value = PaymentProgress.waitPaymentConfirm;
                  })
            else
              Container(),
          ]),
        )));
  }
}
