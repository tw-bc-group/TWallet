import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/views/home/home.dart';

import '../home_store.dart';

void showDialogIfNoIdentity(BuildContext context, HomeStore homeStore) {
  final IdentityStore _identityStore = getIt<IdentityStore>();

  if (_identityStore.identitiesWithoutDapp.isEmpty) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _showAddIdentityDialog(context, homeStore);
    });
  }
}

Future<void> _showAddIdentityDialog(
    BuildContext context, HomeStore homeStore) async {
  return showDialog<void>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      final ScreenUtil screenUtil = ScreenUtil();
      return Material(
          type: MaterialType.transparency,
          child: Center(
              child: Container(
                  width: screenUtil.setWidth(327).toDouble(),
                  height: screenUtil.setHeight(555).toDouble(),
                  decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              top: screenUtil.setHeight(155).toDouble()),
                          child: SvgPicture.asset(
                              'assets/icons/new-identity.svg',
                              width: screenUtil.setWidth(118).toDouble(),
                              height: screenUtil.setHeight(115).toDouble()),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                top: screenUtil.setHeight(38).toDouble(),
                                left: screenUtil.setWidth(71).toDouble(),
                                right: screenUtil.setWidth(71).toDouble()),
                            child: Text(
                              '您还没有添加身份，请前往"身份"页面添加身份',
                              style: WalletFont.font_14(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0)),
                              textAlign: TextAlign.center,
                            )),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenUtil.setWidth(20).toDouble(),
                              vertical: screenUtil.setHeight(48).toDouble()),
                          child: WalletTheme.button(
                              text: '立即前往',
                              height: 44,
                              onPressed: () {
                                Navigator.pop(context);
                                homeStore.currentPage = HomeState.identityIndex;
                              }),
                        )
                      ]))));
    },
  );
}
