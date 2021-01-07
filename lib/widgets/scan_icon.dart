import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';

class ScanIcon extends StatelessWidget {

  ScanIcon({
    this.onTap,
    this.width = 32,
    this.height = 32,
  });

  final double width;
  final double height;
  final GestureTapCallback onTap;

  static const String _svg = 'assets/icons/scan.svg';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 24, top: 6),
      child: GestureDetector(
        onTap: onTap,
        child: SvgPicture.asset(
          _svg,
          color: WalletColor.white,
          width: width,
          height: height,
        ),
      ),
    );
  }
}