import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/models/webview/pincode_dialog/pincode_dialog_error_msg.dart';

class ErrorRowWidget extends StatelessWidget {
  final String errorText;
  final WebviewPincodeDialogErrorMsg pincodeDialogErrorMsg;

  const ErrorRowWidget({this.errorText, this.pincodeDialogErrorMsg});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 7, right: 4),
          child: SvgPicture.asset('assets/icons/error-tip.svg'),
        ),
        Expanded(
            child: Container(
          margin: const EdgeInsets.only(top: 5),
          alignment: Alignment.centerLeft,
          child: Text(
            pincodeDialogErrorMsg?.text ?? errorText,
            style: WalletFont.font_12(
                textStyle: TextStyle(
              color: pincodeDialogErrorMsg?.color == null
                  ? WalletColor.accent
                  : WalletTheme.rgbColor(pincodeDialogErrorMsg?.color),
            )),
          ),
        ))
      ],
    );
  }
}
