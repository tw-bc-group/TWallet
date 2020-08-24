import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/ble/ble_periphery.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';

enum PaymentProgress {
  waitingPayment,
  receivedAskPayment,
  doingPayment,
  success,
}

extension PaymentProgressExtension on PaymentProgress {
  String description() {
    switch (this) {
      case PaymentProgress.waitingPayment:
        return '等待收款';
      case PaymentProgress.receivedAskPayment:
        return '收到付款请求';
      case PaymentProgress.doingPayment:
        return '处理交易';
      case PaymentProgress.success:
        return '交易成功';
      default:
        return '';
    }
  }
}

class Payment extends StatefulWidget {
  final String name;
  final double amount;

  const Payment({Key key, this.name, this.amount}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final _blePeriphery = BlePeriphery();
  final RxString _hintText = RxString('');
  final Rx<PaymentProgress> _paymentProgress =
      Rx(PaymentProgress.waitingPayment);

  Widget _buildButton() {
    if (_paymentProgress.value == PaymentProgress.success) {
      return WalletTheme.button(text: '结束收款', onPressed: () => Get.back());
    } else {
      return Container();
    }
  }

  @override
  void initState() {
    super.initState();

    _paymentProgress
        .listen((value) => _hintText.value += '\n${value.description()}');

    _blePeriphery.startAdvertising('${widget.name}收款${widget.amount}');

    _blePeriphery.readStream().listen((data) {
//      final String command = String.fromCharCodes(data['data'] as Uint8List);
//      if (command.startsWith(askAmount)) {
//        _paymentProgress.value = PaymentProgress.receivedAskPayment;
//        _blePeriphery.sendData(data['device'] as String,
//            Uint8List.fromList('$answerAmount:${widget.amount}'.codeUnits));
//      } else if (command.startsWith(askPayment)) {
//        _paymentProgress.value = PaymentProgress.doingPayment;
//        _blePeriphery.sendData(data['device'] as String,
//            Uint8List.fromList('$answerPayment:${widget.amount}'.codeUnits));
//        _paymentProgress.value = PaymentProgress.success;
//      }
    });

    _paymentProgress.value = PaymentProgress.waitingPayment;
  }

  @override
  void dispose() {
    _blePeriphery.stopAdvertising();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
        bodyBackColor: WalletColor.white,
        title: '收款 ${widget.amount}',
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Obx(
                      () => Text(_hintText.value, textAlign: TextAlign.center)),
                ),
              ),
              Obx(() => _buildButton()),
            ],
          ),
        ));
  }
}
