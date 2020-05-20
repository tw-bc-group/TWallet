import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/application.dart';

class IconBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            iconSize: 28,
            onPressed: () {
              Application.router.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
