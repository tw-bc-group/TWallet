import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/models/health_certification.dart';
import 'package:tw_wallet_ui/models/health_certification_token.dart';
import 'package:tw_wallet_ui/models/identity.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/health_certification_store.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/views/home/home_store.dart';
import 'package:tw_wallet_ui/widgets/hint_dialog.dart';
import 'package:tw_wallet_ui/widgets/identity_card.dart';
import 'package:tw_wallet_ui/widgets/layouts/new_common_layout.dart';

import '../home.dart';

class HealthCertificationPage extends StatelessWidget {
  final IdentityStore _identityStore = getIt<IdentityStore>();
  final HealthCertificationStore certStore = getIt<HealthCertificationStore>();

  HealthCertificationPage();

  @override
  Widget build(BuildContext context) {
    final homeStore = ModalRoute.of(context).settings.arguments as HomeStore;

    return NewCommonLayout(
      appBarActions: <Widget>[
        _buildScanIcon(context),
      ],
      withBottomNavigationBar: false,
      title: "健康认证",
      child: Column(
        children: [
          _tips,
          if (_identityStore.identities.isNotEmpty)
            _buildIdList(context)
          else
            _buildIdentityEmpty(context, homeStore),
        ],
      ),
    );
  }

  Widget get _tips {
    return Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          children: <Widget>[
            const Text(
              "选择右上角进行健康码扫码验证",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0,
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 20, bottom: 15),
                width: 167,
                height: 1,
                decoration: const BoxDecoration(color: Color(0xffffffff))),
            _hint,
            const Text(
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

  Text get _hint {
    final text = _identityStore.identities.isNotEmpty ? "选择使用下方身份" : "添加身份";
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),
    );
  }

  Widget _buildIdentityEmpty(BuildContext context, HomeStore homeStore) {
    return Expanded(
      child: Container(
        margin:
            const EdgeInsets.only(left: 24, right: 24, top: 10, bottom: 147),
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 90, bottom: 46),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SvgPicture.asset(
              'assets/icons/new-identity.svg',
            ),
            Column(
              children: const <Widget>[
                Text("您还没有添加身份",
                    style: TextStyle(
                      color: Color(0xff111111),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0,
                    )),
                Text("请前往“身份”页面添加身份。",
                    style: TextStyle(
                      color: Color(0xff111111),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0,
                    )),
              ],
            ),
            WalletTheme.button(
              text: '立即前往',
              height: 44,
              onPressed: () {
                Navigator.pop(context);
                homeStore.currentPage = HomeState.identityIndex;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIdList(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Observer(
          builder: (BuildContext context) {
            final ids = _identityStore.selectedFirstIdentitiesInHealthDApp;
            return ListView.builder(
              padding: const EdgeInsets.only(top: 10),
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

    final String path = certStore.isBoundCert
        ? '${Routes.healthCode}?id=${identity.id}'
        : '${Routes.certificate}?id=${identity.id}';
    Application.router.navigateTo(context, path);
  }

  Widget _buildScanIcon(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 24, top: 6),
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

  Future<void> _handleScan(BuildContext context) async {
    final String scanResult = await Application.router
        .navigateTo(context, Routes.qrScanner) as String;

    if (null == scanResult) {
      return;
    }

    Future.delayed(const Duration(milliseconds: 500)).then((_) async {
      try {
        final HealthCertificationToken token =
            HealthCertificationToken.fromJson(json.decode(scanResult));
        if (await token.verify()) {
          DialogType _hintType = DialogType.success;
          String _hintText = '无健康风险';

          if (token.healthCertification.sub.healthyStatus.val == unHealthy) {
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
