import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class VcIcon extends StatelessWidget {
  const VcIcon({this.hasBoarder = false, this.width = 75});

  final num width;
  final bool hasBoarder;

  @override
  Widget build(BuildContext context) {
    final num _width = ScreenUtil().setWidth(width);

    return SizedBox(
      width: _width.toDouble(),
      height: _width.toDouble(),
      child: SvgPicture.asset(
        'assets/icons/vc.svg',
        width: _width.toDouble(),
        height: _width.toDouble(),
      ),
    );
  }
}
