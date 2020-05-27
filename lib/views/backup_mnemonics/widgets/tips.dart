import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';

class Tips extends StatelessWidget {
  final String tipText;
  const Tips(this.tipText);

  @override
  Widget build(BuildContext context) {
    final _screenUtil = ScreenUtil();

    return Container(
        padding: EdgeInsets.symmetric(horizontal: _screenUtil.setWidth(6)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: WalletColor.accent.withOpacity(0.1),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset('assets/icons/tips.svg'),
              Expanded(
                  child: Text(tipText,
                      style: WalletFont.font_12(
                          textStyle: TextStyle(
                        color: WalletColor.accent,
                      )))),
            ]));
  }
}
