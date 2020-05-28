import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';

enum BackIcon { none, arrow }

class PageTitleWidget extends StatelessWidget {
  final String title;
  final BackIcon backIcon;
  final List<Widget> appBarActions;

  const PageTitleWidget({
    this.title,
    this.backIcon = BackIcon.arrow,
    this.appBarActions,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 48,
            ),
            if (title != null)
              Text(title,
                  style: WalletFont.font_18(
                      textStyle: TextStyle(color: WalletColor.white))),
          ],
        ),
        if (backIcon != BackIcon.none)
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
        if ((appBarActions?.length ?? 0) > 0)
          Positioned(
            top: 0,
            right: 0,
            child: Row(
              children: appBarActions,
            ),
          ),
      ],
    );
  }
}
