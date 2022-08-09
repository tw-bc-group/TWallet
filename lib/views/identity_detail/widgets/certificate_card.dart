import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';

class CertificateCardWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final String routeTitle;

  const CertificateCardWidget({
    required this.title,
    required this.onTap,
    required this.routeTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: WalletColor.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 34),
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title, style: WalletFont.font_18()),
          GestureDetector(
            onTap: onTap,
            child: Row(
              children: <Widget>[
                Text(
                  routeTitle,
                  style: WalletFont.font_14(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: WalletColor.primary,
                    ),
                  ),
                ),
                SvgPicture.asset('assets/icons/right-arrow.svg')
              ],
            ),
          )
        ],
      ),
    );
  }
}
