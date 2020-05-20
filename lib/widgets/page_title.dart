import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';

enum BackIcon { NONE, ARROW }

class PageTitleWidget extends StatelessWidget {
  final String title;
  final BackIcon backIcon;

  PageTitleWidget({this.title, this.backIcon = BackIcon.ARROW});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 48,
            ),
            if (title != null) Text(
              title,
              style: WalletFont.font_18(
                textStyle: TextStyle(
                  color: WalletColor.white
                )
              )
            ),
          ],
        ),
        if (backIcon != BackIcon.NONE)
          Positioned(
            left: 10,
            top: 0,
            child: IconButton(
              icon: SvgPicture.asset(
                'assets/icons/back-arrow.svg',
                // color: WalletColor.white
              ),
              iconSize: 30,
              color: WalletColor.white,
              onPressed: () {
                Application.router.pop(context);
              },
            ),
          ),
      ],
    ));
  }
}
