import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/models/health_certification.dart';
import 'package:tw_wallet_ui/models/health_certification_token.dart';
import 'package:tw_wallet_ui/models/identity/decentralized_identity.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/health_certification_store.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/views/home/home.dart';
import 'package:tw_wallet_ui/views/home/home_store.dart';
import 'package:tw_wallet_ui/widgets/hint_dialog.dart';
import 'package:tw_wallet_ui/widgets/identity_card.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';
import 'package:tw_wallet_ui/widgets/scan_icon.dart';

class HealthCertificationPage extends StatelessWidget {
  final IdentityStore _identityStore = Get.find();
  final HealthCertificationStore certStore = Get.find();

  HealthCertificationPage();

  @override
  Widget build(BuildContext context) {
    final homeStore = ModalRoute.of(context)!.settings.arguments! as HomeStore;

    return CommonLayout(
      appBarActions: <Widget>[ScanIcon(onTap: () => _handleScan(context))],
      title: "Health Cert",
      child: Column(
        children: [
          _tips,
          if (_identityStore.identitiesWithoutDapp.isNotEmpty)
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
            "Select the upper right for health code scanning verification",
            textAlign: TextAlign.center,
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
            decoration: const BoxDecoration(color: Color(0xffffffff)),
          ),
          _hint,
          const Text(
            "Make a health certification or view a health code",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              letterSpacing: 0,
            ),
          ),
        ],
      ),
    );
  }

  Text get _hint {
    final text = _identityStore.identitiesWithoutDapp.isNotEmpty
        ? "Select identity below"
        : "Add identity";
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
    final ScreenUtil screenUtil = ScreenUtil();

    return Expanded(
      child: Container(
        margin: EdgeInsets.only(
          left: screenUtil.setWidth(24),
          right: screenUtil.setWidth(24),
          top: screenUtil.setHeight(10),
          bottom: screenUtil.setHeight(147),
        ),
        padding: EdgeInsets.only(
          left: screenUtil.setWidth(20),
          right: screenUtil.setWidth(20),
          top: screenUtil.setHeight(90),
          bottom: screenUtil.setHeight(46),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SvgPicture.asset(
              'assets/icons/new-identity.svg',
            ),
            Column(
              children: const <Widget>[
                Text(
                  "No identity yet",
                  style: TextStyle(
                    color: Color(0xff111111),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0,
                  ),
                ),
                Text(
                  "Please add identity in 'identity' page",
                  style: TextStyle(
                    color: Color(0xff111111),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0,
                  ),
                ),
              ],
            ),
            WalletTheme.button(
              text: 'Add now',
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
                  name: ele.profileInfo.name,
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

  Future _onIdentityTap(
    BuildContext context,
    DecentralizedIdentity identity,
  ) async {
    Future safeUseBuildContextAsynchronously() {
      final String path = certStore.isBoundCert
          ? '${Routes.healthCode}?id=${identity.id}'
          : '${Routes.certificate}?id=${identity.id}';
      return Application.router.navigateTo(context, path);
    }

    await certStore.fetchHealthCertByDID(identity.did.toString());
    await _identityStore.updateHealthCertLastSelected(identity);

    return safeUseBuildContextAsynchronously();
  }

  Future<void> _handleScan(BuildContext context) async {
    final String? scanResult = await Application.router
        .navigateTo(context, Routes.qrScanner) as String?;

    if (null == scanResult) {
      return;
    }

    return Future.delayed(const Duration(milliseconds: 500)).then((_) async {
      try {
        final HealthCertificationToken token =
            HealthCertificationToken.fromJson(json.decode(scanResult));
        if (await token.verify()) {
          DialogType hintType = DialogType.success;
          String hintText = '无健康风险';

          if (token.healthCertification.sub.healthyStatus.val == unHealthy) {
            hintType = DialogType.error;
            hintText = '存在健康风险';
          }

          final String subHintText =
              '该健康码和持有人身份相符。\n\n身份信息：${token.healthCertification.sub.id}\n\n该健康认证结果由防疫中心（${token.healthCertification.iss}）提供。';

          await hintDialogHelper(
            context,
            hintType,
            hintText,
            subText: subHintText,
          );
        } else {
          await hintDialogHelper(context, DialogType.warning, '该健康码与持有人身份不符');
        }
      } catch (_) {
        await hintDialogHelper(context, DialogType.warning, '未识别到有效的身份信息');
      }
    });
  }
}
