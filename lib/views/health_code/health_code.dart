import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/global/common/theme.dart';
import 'package:tw_wallet_ui/global/store/health_certification_store.dart';
import 'package:tw_wallet_ui/global/store/identity_store.dart';
import 'package:tw_wallet_ui/global/widgets/layouts/common_layout.dart';
import 'package:tw_wallet_ui/models/health_certification.dart';
import 'package:tw_wallet_ui/models/identity.dart';

class HealthCodePage extends StatefulWidget {
  final String id;

  @override
  State<StatefulWidget> createState() {
    return HealthCodeState(id: id);
  }

  HealthCodePage({this.id});
}

class HealthCodeState extends State<HealthCodePage> {
  final identityStore = getIt<IdentityStore>();
  final certStore = getIt<HealthCertificationStore>();

  final String id;
  int counter = 60;
  Identity identity;
  Timer countTimer;

  HealthCodeState({this.id});

  Future onRefresh() async {
    return this.refreshHealthCode();
  }

  @override
  void initState() {
    super.initState();
    this.identity = identityStore.getIdentityById(id);
    this.refreshHealthCode();
  }

  @override
  void dispose() {
    resetCountTimer(dispose: true);
    super.dispose();
  }

  refreshHealthCode() {
    certStore
        .fetchLatestHealthCert(identity.did.toString())
        .whenComplete(() => startCount());
  }

  resetCountTimer({bool dispose: false}) {
    if (countTimer != null) {
      countTimer.cancel();
      countTimer = null;
      if (!dispose) {
        setState(() {
          counter = 60;
        });
      }
    }
  }

  startCount() {
    resetCountTimer();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (countTimer == null) {
        countTimer = timer;
      }
      setState(() {
        counter--;
        if (counter == 0) {
          resetCountTimer();
          refreshHealthCode();
        }
      });
    });
  }

  getCounterText() {
    if (counter >= 60 || counter < 0) {
      return '';
    }

    if (counter > 0 && counter < 10) {
      return '00:0$counter';
    }

    return '00:$counter';
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
        title: '健康码',
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 49),
            children: <Widget>[
              Container(
                margin: EdgeInsetsDirectional.only(top: 40),
                child: Center(
                  child: Text(getCounterText()),
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(top: 10),
                child: Center(
                  child: Text(identity.name,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: WalletTheme.rgbColor('#222222'),
                          height: 1.6)),
                ),
              ),
              observeQrImage(),
              Center(
                child: Text(
                  '绿码：截止到当前，该身份的持有者没有暴露在病毒污染的环境中。',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      letterSpacing: 1.4,
                      color: WalletTheme.rgbColor('#888888'),
                      height: 1.43),
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(top: 20),
                child: Center(
                    child: Text(
                  '红码：该身份的持有者有病毒污染暴露风险。',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      letterSpacing: 1.4,
                      color: WalletTheme.rgbColor('#888888'),
                      height: 1.43),
                )),
              )
            ],
          ),
        ));
  }

  Widget observeQrImage() {
    return Observer(builder: (BuildContext context) {
      print(certStore.healthCertification);
      if (certStore.healthCertification == null) return Container();
      return _buildQrImage(
          encodeQRData(certStore.healthCertification), certStore.isHealthy);
    });
  }

  String encodeQRData(HealthCertification cert) {
    return json.encode(cert.toJson());
  }

  Widget _buildQrImage(String data, bool isHealth) {
    final color = isHealth ? Colors.green : Colors.red;
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(border: Border.all(color: color, width: 5)),
      child: QrImage(data: data, foregroundColor: color),
    );
  }
}
