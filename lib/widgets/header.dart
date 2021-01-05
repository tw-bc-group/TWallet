import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';

class Header extends StatelessWidget {
  final String title;

  const Header({
    @required this.title
  });

  @override
  Widget build(BuildContext context) {
    {
      return Container(
        height: 70,
        color: WalletColor.primary,
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            Center(
              child: Text(title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.5,
                  )),
            ),
          ],
        ),
      );
    }
  }
}
