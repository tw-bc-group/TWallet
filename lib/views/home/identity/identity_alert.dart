import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/generated/l10n.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/views/home/home.dart';
import 'package:tw_wallet_ui/views/home/home_store.dart';

void showDialogIfNoIdentity(BuildContext context, HomeStore homeStore) {
  final IdentityStore identityStore = Get.find();

  if (identityStore.identitiesWithoutDapp.isEmpty) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _showAddIdentityDialog(context, homeStore);
    });
  }
}

Future<void> _showAddIdentityDialog(
  BuildContext context,
  HomeStore homeStore,
) async {
  return showDialog<void>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      final ScreenUtil screenUtil = ScreenUtil();
      return Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            width: screenUtil.setWidth(327),
            height: screenUtil.setHeight(555),
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: screenUtil.setHeight(155),
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/new-identity.svg',
                    width: screenUtil.setWidth(118),
                    height: screenUtil.setHeight(115),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: screenUtil.setHeight(38),
                    left: screenUtil.setWidth(71),
                    right: screenUtil.setWidth(71),
                  ),
                  child: Text(
                    S.of(context).pageHomeNoIdentity,
                    style: WalletFont.font_14(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenUtil.setWidth(20),
                    vertical: screenUtil.setHeight(48),
                  ),
                  child: WalletTheme.button(
                    text: S.of(context).pageHomeGoNow,
                    height: 44,
                    onPressed: () {
                      Navigator.pop(context);
                      homeStore.currentPage = HomeState.identityIndex;
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
