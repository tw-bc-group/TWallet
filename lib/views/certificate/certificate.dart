import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tw_wallet_ui/global/common/application.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/global/common/theme.dart';
import 'package:tw_wallet_ui/global/service/api_provider.dart';
import 'package:tw_wallet_ui/global/store/identity_store.dart';
import 'package:tw_wallet_ui/global/widgets/layouts/common_layout.dart';
import 'package:tw_wallet_ui/models/health_certification.dart';
import 'package:tw_wallet_ui/models/identity.dart';

final RegExp phoneReg = RegExp(r'^(?:\+?86)?1(?:3\d{3}|5[^4\D]\d{2}|8\d{3}|7(?:[235-8]\d{2}|4(?:0\d|1[0-2]|9\d))|9[0135-9]\d{2}|66\d{2})\d{6}$');

class CertificatePage extends StatefulWidget {
  final String id;

  CertificatePage({this.id});

  @override
  State<StatefulWidget> createState() {
    return CertificateState(id: id);
  }
}

class CertificateState extends State<CertificatePage> {
  final String id;
  final IdentityStore identityStore = getIt<IdentityStore>();
  final ApiProvider apiProvider = getIt<ApiProvider>();
  String phoneNumber = '';
  bool phoneNumberErr = false;

  CertificateState({this.id});

  Identity getIdentity() {
    var identityResult;
    identityStore.identities.forEach((identity) {
      if (identity.id == id) {
        identityResult = identity;
      }
    });
    return identityResult;
  }

  handleInputChanged(String value) {
    setState(() {
      phoneNumber = value;
      phoneNumberErr = false;
    });
  }

  handleConfirm() {
    if (phoneReg.stringMatch(phoneNumber) == null) {
      return setState(() {
        phoneNumberErr = true;
      });
    }
    apiProvider.healthCertificate(phoneNumber, getIdentity().did.toString()).then(
      (HealthCertification response) {
        var currentIdentity = getIdentity();
        var newIdentity = currentIdentity.rebuild((_identity) {
          _identity
            ..healthCertificateStatus = CERTIFICATED
            ..healthStatus = response.sub.healthyStatus.val;
        });
        identityStore.updateIdentity(newIdentity);
        Application.router.pop(context);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      title: '健康认证',
      withBottomBtn: true,
      btnText: '确定',
      btnOnPressed: phoneNumber == '' ? null : handleConfirm,
      bodyBackColor: '#fafafa',
      child: Container(
        padding: EdgeInsets.only(top: 32, left: 32, right: 32),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '请输入以下信息：',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: WalletTheme.rgbColor('#222222'),
                    height: 1.6,
                    letterSpacing: 0.75
                  ),
                ),
              ]
            ),
            Container(
              margin: EdgeInsets.only(top: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '手机号码',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: WalletTheme.rgbColor('#222222'),
                      height: 1.6,
                      letterSpacing: 0.75
                    ),
                  ),
                  phoneNumberErr ? Text(
                    '*请输入正确的手机号码',
                    style: TextStyle(
                      fontSize: 10,
                      color: WalletTheme.rgbColor('#dd5757'),
                      letterSpacing: 2.5
                    ),
                  ) : Container()
                ],
              )
            ),
            Container(
              height: 47,
              margin: EdgeInsets.only(top: 8),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: WalletTheme.rgbColor('#f1f0f0'),
                borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                keyboardType: TextInputType.phone,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter(RegExp(r'\d+')),
                ],
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none),
                  ),
                ),
                style: TextStyle(
                    fontSize: 16, color: WalletTheme.rgbColor('#888888')),
                onChanged: handleInputChanged,
              )
            ),
          ],
        ),
      )
    );
  }
}
