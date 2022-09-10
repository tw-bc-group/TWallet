import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/generated/l10n.dart';

class HomePageHeader extends StatelessWidget {
  final Widget avatar;
  final String name;
  final TabBar tabBar;
  final GestureTapCallback? onAvatarTap;
  final GestureTapCallback? onChangeIdentityTap;
  final ImageProvider bgImage =
      const AssetImage('assets/images/background.png');
  final SvgPicture changeImg =
      SvgPicture.asset('assets/icons/change-identity.svg');

  HomePageHeader({
    required this.avatar,
    required this.name,
    required this.tabBar,
    this.onAvatarTap,
    this.onChangeIdentityTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 26),
      padding: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: WalletColor.primary,
        image: DecorationImage(
          alignment: Alignment.bottomCenter,
          fit: BoxFit.fitWidth,
          image: bgImage,
        ),
      ),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: onAvatarTap,
            child: Container(
              margin: const EdgeInsets.only(bottom: 14),
              child: avatar,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            child: _buildName(name),
          ),
          GestureDetector(
            onTap: onChangeIdentityTap,
            child: _buildChangeIdentityButton(),
          ),
          tabBar,
        ],
      ),
    );
  }

  Widget _buildChangeIdentityButton() {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          changeImg,
          const SizedBox(width: 4),
          Text(
            S.current.pageHomeChangeIdentity,
            style: TextStyle(
              color: WalletColor.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              letterSpacing: 1,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildName(String name) => Text(
        name,
        style: TextStyle(
          color: WalletColor.white,
          fontSize: 24,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          letterSpacing: 1.2,
        ),
      );
}
