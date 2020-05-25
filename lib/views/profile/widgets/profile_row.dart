import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';

class ProfileRowWidget extends StatelessWidget {
  final String assetIcon;
  final String name;
  final dynamic value;
  final bool withoutBottomBorder;

  ProfileRowWidget({this.assetIcon, this.name, this.value, this.withoutBottomBorder = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        border: withoutBottomBorder ? null : Border(bottom: BorderSide(width: 1, color: WalletColor.middleGrey))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 66),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                if (assetIcon != null) Container(
                  margin: EdgeInsets.only(right: 10),
                  child: SvgPicture.asset(assetIcon),
                ),
                if (name != null) Text(
                  name,
                  style: WalletFont.font_14(
                    textStyle: TextStyle(
                      color: WalletColor.grey
                    )
                  ),
                ),
              ],
            ),
          ),
          if (value != null) Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: value is Widget
                  ? value
                  : Text(
                      value,
                      style: WalletFont.font_14(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w600
                        )
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
