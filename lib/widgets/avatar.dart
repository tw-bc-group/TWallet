import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({this.width = 75});

  final num width;

  @override
  Widget build(BuildContext context) {
    final num width = ScreenUtil().setWidth(this.width);

    return SizedBox(
      width: width.toDouble(),
      height: width.toDouble(),
      child: CircleAvatar(
        backgroundColor: WalletColor.grey,
        child: SvgPicture.asset(
          'assets/icons/avatar.svg',
          width: width.toDouble(),
          height: width.toDouble(),
        ),
      ),
    );
  }
}
