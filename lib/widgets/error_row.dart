import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';

class ErrorRowWidget extends StatelessWidget {
  final String errorText;

  const ErrorRowWidget(this.errorText);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
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
            errorText,
            style: WalletFont.font_12(
                textStyle: TextStyle(
              color: WalletColor.accent,
            )),
          ),
        ))
      ],
    );
  }
}
