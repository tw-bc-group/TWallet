import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';

import '../home.dart';
import '../home_store.dart';

showDialogIfNoIdentity(BuildContext context, HomeStore homeStore) {
  final IdentityStore _identityStore = getIt<IdentityStore>();

  if (_identityStore.identities.isEmpty) {
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
      final double width = MediaQuery.of(context).size.width;
      final double height = MediaQuery.of(context).size.height;

      return SimpleDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.06),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: height * 0.16),
            child: SvgPicture.asset('assets/icons/new-identity.svg'),
          ),
          Padding(
              padding: EdgeInsets.only(
                  top: height * 0.05, left: width * 0.13, right: width * 0.13),
              child: Text(
                '您还没有添加身份，请前往\"身份\"页面添加身份',
                style: WalletFont.font_14(
                    textStyle: TextStyle(fontWeight: FontWeight.w400)),
                textAlign: TextAlign.center,
              )),
          Padding(
            padding: EdgeInsets.only(top: height * 0.15),
            child: WalletTheme.button(
                text: '立即前往',
                onPressed: () {
                  Navigator.pop(context);
                  homeStore.changePage(HomeState.identityIndex);
                }),
          ),
        ],
      );
    },
  );
}
