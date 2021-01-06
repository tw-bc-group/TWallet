import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/models/vc_type_response.dart';

class VcTypeCard extends StatelessWidget {
  final VcType vcType;
  final bool isSelected;
  final GestureTapCallback onTap;

  const VcTypeCard({
    @required this.vcType,
    this.isSelected = true,
    this.onTap,
  });

  Color get fontColor => isSelected ? WalletColor.white : WalletColor.black;
  Color get bgColor => isSelected ? WalletColor.primary : WalletColor.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: <Widget>[
                _buildVcInfo(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVcInfo() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        child: Text.rich(TextSpan(
            style: WalletFont.font_12(textStyle: TextStyle(color: fontColor)),
            children: <TextSpan>[
              TextSpan(
                  text: "${vcType.name}\n",
                  style: WalletFont.font_16(
                      textStyle: TextStyle(
                          height: 2,
                          fontWeight: FontWeight.w600,
                          color: fontColor))),
              TextSpan(text: "    ${vcType.content.join("、")}\n")
            ])),
      ),
    );
  }
}
