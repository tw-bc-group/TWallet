import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/service/pincode.dart';
import 'package:tw_wallet_ui/views/transfer_confirm/widgets/input_pin.dart';

class PinDialogWidget extends StatelessWidget {
  final Completer completer;
  final GlobalKey<InputPinWidgetState> inputPinWidgetKey =
      GlobalKey<InputPinWidgetState>();

  PinDialogWidget({this.completer});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 50),
        color: WalletColor.white,
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () => PincodeService.dismissPincodeDialog(),
              child: Align(
                alignment: Alignment.centerRight,
                child: SvgPicture.asset('assets/icons/pin-code-close.svg'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                'PIN CODE',
                textAlign: TextAlign.center,
                style: WalletFont.font_16(),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 16),
              child: Text(
                'Please input PIN code to confirm transaction',
                textAlign: TextAlign.center,
                style: WalletFont.font_12(),
              ),
            ),
            InputPinWidget(
              key: inputPinWidgetKey,
              autoValidate: true,
              completer: completer,
            ),
          ],
        ));
  }
}
