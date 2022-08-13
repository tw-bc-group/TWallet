import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';

class ProfileRowWidget extends StatelessWidget {
  final String assetIcon;
  final String name;
  final dynamic value;
  final bool withoutBottomBorder;

  const ProfileRowWidget({
    required this.assetIcon,
    required this.name,
    this.value,
    this.withoutBottomBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        border: withoutBottomBorder
            ? null
            : Border(bottom: BorderSide(color: WalletColor.middleGrey)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 50),
            child: Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: SvgPicture.asset(assetIcon),
                ),
                Text(
                  name,
                  style: WalletFont.font_14(
                    textStyle: TextStyle(color: WalletColor.grey),
                  ),
                ),
              ],
            ),
          ),
          if (value != null)
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: value is Widget
                    ? value as Widget
                    : Text(
                        value as String,
                        style: WalletFont.font_14(
                          textStyle:
                              const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
              ),
            )
        ],
      ),
    );
  }
}
