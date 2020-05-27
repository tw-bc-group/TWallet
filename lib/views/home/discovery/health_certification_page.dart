import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/models/health_certification.dart';
import 'package:tw_wallet_ui/models/health_certification_token.dart';
import 'package:tw_wallet_ui/models/identity.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/health_certification_store.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/widgets/hint_dialog.dart';
import 'package:tw_wallet_ui/widgets/identity_card.dart';
import 'package:tw_wallet_ui/widgets/layouts/new_common_layout.dart';
import 'package:tw_wallet_ui/widgets/page_title.dart';

class HealthCertificationPage extends StatelessWidget {
  final IdentityStore _identityStore = getIt<IdentityStore>();
  final HealthCertificationStore certStore = getIt<HealthCertificationStore>();

  @override
  Widget build(BuildContext context) {
    return NewCommonLayout(
      appBarActions: <Widget>[
        _buildScanIcon(context),
      ],
      withBottomNavigationBar: false,
      backIcon: BackIcon.ARROW,
      title: "健康认证",
      child: Column(
        children: [_tips, _buildIdList(context)],
      ),
    );
  }

  Widget get _tips {
    return Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "选择右上角进行健康码扫码验证",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0,
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20, bottom: 15),
                width: 167,
                height: 1,
                decoration: BoxDecoration(color: Color(0xffffffff))),
            Text(
              "选择使用下方身份",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0,
              ),
            ),
            Text(
              "进行健康认证或查看健康码",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0,
              ),
            ),
          ],
        ));
  }

  Widget _buildIdList(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Observer(
          builder: (BuildContext context) {
            final ids = _identityStore.selectedFirstIdentitiesInHealthDApp;
            return ListView.builder(
              padding: EdgeInsets.only(top: 10),
              itemCount: ids.length,
              itemBuilder: (BuildContext context, int index) {
                final ele = ids[index];
                return IdentityCard(
                  name: ele.name,
                  did: ele.did.toString(),
                  onTap: () => _onIdentityTap(context, ele),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Future _onIdentityTap(BuildContext context, Identity identity) async {
    await certStore.fetchHealthCertByDID(identity.did.toString());
    _identityStore.updateHealthCertLastSelected(identity);

    var path = certStore.isBoundCert
        ? '${Routes.healthCode}?id=${identity.id}'
        : '${Routes.certificate}?id=${identity.id}';
    Application.router.navigateTo(context, path);
  }

  Widget _buildScanIcon(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 24, top: 6),
      child: GestureDetector(
        onTap: () => _handleScan(context),
        child: SvgPicture.asset(
          'assets/icons/scan.svg',
          color: WalletColor.white,
          width: 32,
          height: 32,
        ),
      ),
    );
  }

  _handleScan(BuildContext context) async {
    String scanResult =
        await Application.router.navigateTo(context, Routes.qrScanner);

    if (null == scanResult) {
      return;
    }

    Future.delayed(Duration(milliseconds: 500)).then((_) async {
      try {
        HealthCertificationToken token =
            HealthCertificationToken.fromJson(json.decode(scanResult));
        if (await token.verify()) {
          DialogType _hintType = DialogType.success;
          String _hintText = '无健康风险';

          if (token.healthCertification.sub.healthyStatus.val == UNHEALTHY) {
            _hintType = DialogType.error;
            _hintText = '存在健康风险';
          }

          final String _subHintText =
              '该健康码和持有人身份相符。\n\n身份信息：${token.healthCertification.sub.id}\n\n该健康认证结果由防疫中心（${token.healthCertification.iss}）提供。';

          await hintDialogHelper(context, _hintType, _hintText,
              subText: _subHintText);
        } else {
          await hintDialogHelper(context, DialogType.warning, '该健康码与持有人身份不符');
        }
      } catch (_) {
        await hintDialogHelper(context, DialogType.warning, '未识别到有效的身份信息');
      }
    });
  }
}
