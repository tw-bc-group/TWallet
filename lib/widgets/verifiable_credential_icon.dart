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
    final num width = ScreenUtil().setWidth(this.width);

    return SizedBox(
      width: width.toDouble(),
      height: width.toDouble(),
      child: SvgPicture.asset(
        'assets/icons/vc.svg',
        width: width.toDouble(),
        height: width.toDouble(),
      ),
    );
  }
}
