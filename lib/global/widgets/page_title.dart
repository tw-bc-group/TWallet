import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/global/common/application.dart';
import 'package:tw_wallet_ui/global/common/theme/index.dart';

enum BackIcon { NONE, CLOSE, ARROW }

const Map<BackIcon, IconData> BackIconMap = {
  BackIcon.CLOSE: Icons.close,
  BackIcon.ARROW: Icons.chevron_left
};

class PageTitleWidget extends StatelessWidget {
  final String title;
  final BackIcon backIcon;

  PageTitleWidget({this.title, this.backIcon = BackIcon.CLOSE});

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
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        if (backIcon != BackIcon.NONE)
          Positioned(
            left: 17,
            top: 0,
            child: IconButton(
              icon: Icon(BackIconMap[backIcon]),
              iconSize: 30,
              color: WalletTheme.rgbColor('#aaaaaa'),
              onPressed: () {
                Application.router.pop(context);
              },
            ),
          ),
      ],
    ));
  }
}
