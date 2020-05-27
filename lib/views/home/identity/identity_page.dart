import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/models/health_certification.dart';
import 'package:tw_wallet_ui/models/health_certification_token.dart';
import 'package:tw_wallet_ui/models/identity.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/widgets/avatar.dart';
import 'package:tw_wallet_ui/widgets/hint_dialog.dart';

import '../../../router/routers.dart';

class IdentityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IdentityPageState();
}

class _IdentityPageState extends State<IdentityPage> {
  final IdentityStore _store = getIt<IdentityStore>();

  Widget _listItem(Identity identity) {
    return Container(
        margin: EdgeInsets.only(bottom: 24),
        child: GestureDetector(
            onTap: () {
              Application.router
                  .navigateTo(context, '${Routes.identityDetail}?id=${identity.id}');
            },
            child: Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                    color: WalletColor.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0x0f000000),
                          offset: Offset(0, 4),
                          blurRadius: 12,
                          spreadRadius: 0)
                    ]),
                child: Column(children: <Widget>[
                  Row(children: <Widget>[
                    AvatarWidget(width: 32),
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.only(left: 12),
                            child: Text(
                              identity.name,
                              style: WalletFont.font_18(),
                            )))
                  ]),
                  Container(
                      margin: EdgeInsets.only(top: 16, bottom: 16),
                      height: 1,
                      color: WalletColor.middleGrey),
                  GestureDetector(
                    child: Text(
                      identity.did.toString(),
                      style: WalletFont.font_12(
                        textStyle: TextStyle(color: WalletColor.grey),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onLongPress: () async {
                      Clipboard.setData(
                          ClipboardData(text: identity.did.toString()));
                      await showDialogSample(context, DialogType.none, '复制成功');
                    },
                  )
                ]))));
  }

  @override
  void initState() {
    super.initState();
  }

  Widget buildHeader() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Center(
                child: Text('身份',
                    style: WalletFont.font_18(
                        textStyle: TextStyle(color: WalletColor.white)))),
            Positioned(
              child: GestureDetector(
                onTap: () async {
                  String scanResult = await Application.router
                      .navigateTo(context, Routes.qrScanner);

                  if (null == scanResult) {
                    return;
                  }

                  Future.delayed(Duration(milliseconds: 500)).then((_) async {
                    try {
                      HealthCertificationToken token =
                          HealthCertificationToken.fromJson(
                              json.decode(scanResult));
                      if (await token.verify()) {
                        DialogType _hintType = DialogType.success;
                        String _hintText = '无健康风险';

                        if (token.healthCertification.sub.healthyStatus.val ==
                            UNHEALTHY) {
                          _hintType = DialogType.error;
                          _hintText = '存在健康风险';
                        }

                        final String _subHintText =
                            '该健康码和持有人身份相符。\n\n身份信息：${token.healthCertification.sub.id}\n\n该健康认证结果由防疫中心（${token.healthCertification.iss}）提供。';

                        await hintDialogHelper(context, _hintType, _hintText,
                            subText: _subHintText);
                      } else {
                        await hintDialogHelper(
                            context, DialogType.warning, '该健康码与持有人身份不符');
                      }
                    } catch (_) {
                      await hintDialogHelper(
                          context, DialogType.warning, '未识别到有效的身份信息');
                    }
                  });
                },
                child: SvgPicture.asset('assets/icons/scan.svg',
                    color: WalletColor.white, width: 40, height: 40),
              ),
              top: -10,
              right: 0,
            )
          ],
        )
        // TextField(
        //   controller: _filter,
        //   onChanged: (String value) => _store.updateSearchName(value),
        //   decoration: InputDecoration(
        //       prefixIcon: Icon(Icons.search), hintText: 'Search...'),
        // ),
      ],
    );
  }

  Widget buildNewIdentityCard() {
    if (_store.identities.length == 0) {
      return Container(
        margin: EdgeInsets.only(bottom: 24),
        padding: EdgeInsets.only(top: 68, bottom: 78, left: 84, right: 84),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Color(0x0f000000),
                offset: Offset(0, 4),
                blurRadius: 12,
                spreadRadius: 0)
          ],
          color: WalletColor.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage('assets/images/id-card.png')),
            Container(
              margin: EdgeInsets.only(top: 56),
              child: WalletTheme.button(
                  text: '新增身份',
                  onPressed: () => Application.router
                      .navigateTo(context, Routes.newIdentity)),
            )
          ],
        ),
      );
    }

    return Container(
      margin: EdgeInsets.only(bottom: 24),
      padding: EdgeInsets.symmetric(horizontal: 64, vertical: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Color(0x0f000000),
              offset: Offset(0, 4),
              blurRadius: 12,
              spreadRadius: 0)
        ],
        color: WalletColor.white,
      ),
      child: WalletTheme.button(
          text: '新增身份',
          onPressed: () =>
              Application.router.navigateTo(context, Routes.newIdentity)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: WalletColor.primary,
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              alignment: Alignment.bottomCenter),
        ),
        child: Column(children: <Widget>[
          Container(padding: EdgeInsets.all(10), child: buildHeader()),
          Expanded(child: Observer(builder: (_) {
            return Container(
                padding: EdgeInsets.only(top: 24, left: 24, right: 24),
                child: ListView(
                  children: _store.identities
                          .where((identity) =>
                              identity.name.contains(_store.searchName))
                          .map((identity) => _listItem(identity))
                          .toList() +
                      [buildNewIdentityCard()],
                ));
          }))
        ]));
  }
}
