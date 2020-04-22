import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/global/common/theme.dart';
import 'package:tw_wallet_ui/global/widgets/avatar.dart';
import 'package:tw_wallet_ui/global/widgets/page_title.dart';
import 'package:tw_wallet_ui/views/identity_detail/widgets/detail_row.dart';

import '../../global/common/get_it.dart';
import '../../global/store/identity_store.dart';
import '../../models/identity.dart';

class IdentityDetailPage extends StatelessWidget {
  final String id;
  final IdentityStore identityStore = getIt<IdentityStore>();

  IdentityDetailPage({this.id});

  Identity getIdentity() {
    var identityResult;
    identityStore.identities.forEach((identity) {
      if (identity.id == id) {
        identityResult = identity;
      }
    });
    return identityResult;
  }

  @override
  Widget build(BuildContext context) {
    var identity = getIdentity();
    return Scaffold(
        backgroundColor: WalletTheme.titleBgColor,
        body: SafeArea(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 0),
              child: Column(
                children: <Widget>[
                  PageTitleWidget(title: '个人信息'),
                  DetailRowWidget(
                    name: '头像',
                    value: AvatarWidget(avataaar: identity.avataaar),
                  ),
                  DetailRowWidget(name: '名称*', value: identity.name),
                  DetailRowWidget(name: '邮箱', value: identity.email),
                  DetailRowWidget(name: '电话', value: identity.phone),
                  DetailRowWidget(name: '生日', value: identity.birthday ?? ''),
                  DetailRowWidget(name: 'DID', value: identity.did),
                  DetailRowWidget(
                      value: GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 70,
                            height: 30,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2,
                                    color: Theme.of(context).primaryColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Center(
                              child: Text(
                                '实名认证',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ))),
                ],
              )),
        ));
  }
}
