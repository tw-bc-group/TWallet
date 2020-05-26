import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tw_wallet_ui/widgets/avatar.dart';

class IdentityCard extends StatelessWidget {
  final String name;
  final String did;
  final Color bgColor;
  final bool isSelected;

  const IdentityCard({
    @required this.name,
    @required this.did,
    this.bgColor = Colors.white,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: <Widget>[
              AvatarWidget(width: 70),
              _buildIdentityInfo(),
            ],
          ),
        ),
        if (isSelected) _buildSelectedIcon(),
      ],
    );
  }

  Positioned _buildSelectedIcon() {
    return Positioned(
      top: 0,
      right: 0,
      child: SvgPicture.asset(
        "assets/icons/id-selected.svg",
        width: 32,
        height: 32,
      ),
    );
  }

  _buildIdentityInfo() {
    return Expanded(
      child: Container(
        height: 70,
        margin: EdgeInsets.only(left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  color: Color(0xff111111),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
            ),
            Expanded(
              child: Text(
                did,
                style: TextStyle(
                  color: Color(0xff110000),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
