import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/generated/l10n.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';
import 'package:tw_wallet_ui/widgets/page_title.dart';

class NewWalletWidget extends StatelessWidget {
  Widget buildBigButton({required String title, bool disabled = false}) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(vertical: 50),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: WalletColor.lightGrey,
      ),
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Text(
              title,
              style: WalletFont.font_18(
                textStyle: TextStyle(
                  color: disabled ? WalletColor.grey : WalletColor.primary,
                ),
              ),
            ),
            Positioned(
              top: -7,
              left: -76,
              child: SvgPicture.asset(
                'assets/icons/new-wallet.svg',
                color: disabled ? WalletColor.grey : WalletColor.primary,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = S.of(context);
    return CommonLayout(
      backIcon: BackIcon.none,
      bodyBackColor: WalletColor.white,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          color: WalletColor.white,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 44),
                child: Text(
                  t.pageNewWalletYouCan,
                  style: WalletFont.font_20(),
                  textAlign: TextAlign.center,
                ),
              ),
              GestureDetector(
                onTap: () => Application.router
                    .navigateTo(context, Routes.backupMnemonics),
                child: buildBigButton(title: t.pageNewWalletCreate),
              ),
              GestureDetector(
                onTap: () => Application.router
                    .navigateTo(context, Routes.restoreMnemonics),
                child: buildBigButton(title: t.pageNewWalletRestore),
              ),
              // GestureDetector(
              //   onTap: () => Application.router
              //       .navigateTo(context, Routes.web3authLogin),
              //   child: buildBigButton(title: t.pageNewWalletWeb2),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
