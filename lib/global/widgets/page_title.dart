import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/global/common/application.dart';
import 'package:tw_wallet_ui/global/common/theme.dart';

class PageTitleWidget extends StatelessWidget {
  final String title;
  
  PageTitleWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
        Positioned(
          left: -15,
          top: 0,
          child: IconButton(
            icon: Icon(Icons.close),
            iconSize: 30,
            color: WalletTheme.rgbColor('#aaaaaa'),
            onPressed: () {
              Application.router.pop(context);
            },
          ),
        ),
      ],
    );
  }
}