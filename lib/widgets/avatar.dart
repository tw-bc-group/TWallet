import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({this.hasBoarder = false, this.width = 75});

  final num width;
  final bool hasBoarder;

  @override
  Widget build(BuildContext context) {
    final num _width = ScreenUtil().setWidth(width);

    final decoration = hasBoarder
        ? BoxDecoration(
            borderRadius: BorderRadius.circular(_width / 2),
            border: Border.all(width: 2.0, color: const Color(0xFFFFFFFF)),
          )
        : null;

    return Container(
      decoration: decoration,
      child: SizedBox(
        width: _width.toDouble(),
        height: _width.toDouble(),
        child: CircleAvatar(
          backgroundColor: WalletColor.grey,
          child: SvgPicture.asset(
            'assets/icons/avatar.svg',
            width: _width.toDouble(),
            height: _width.toDouble(),
          ),
        ),
      ),
    );
  }
}
