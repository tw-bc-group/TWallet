import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/models/health_certification.dart';
import 'package:tw_wallet_ui/models/identity.dart';
import 'package:tw_wallet_ui/store/health_certification_store.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';

import 'health_code_store.dart';

class HealthCodePage extends StatefulWidget {
  final String id;

  @override
  State<StatefulWidget> createState() {
    return HealthCodeState(id: id);
  }

  HealthCodePage({this.id});
}

class HealthCodeState extends State<HealthCodePage> {
  final certStore = getIt<HealthCertificationStore>();
  HealthCodeStore _certStore;

  final String id;
  Identity identity;

  HealthCodeState({this.id});

  Future onRefresh() async {
    return _certStore.fetchLatestHealthCode();
  }

  @override
  void initState() {
    super.initState();
    identity = getIt<IdentityStore>().getIdentityById(id);
    _certStore = HealthCodeStore(identity.did, 60);
  }

  @override
  void dispose() {
    _certStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Observer(builder: (_) {
        final ObservableFuture<void> future =
            _certStore.fetchHealthCodeStream.value;

        print('future status: ${future.status}');

        return CommonLayout(
          title: '健康码',
          // ignore: missing_return
          childBuilder: (context, constraints) {
            switch (future.status) {
              case FutureStatus.pending:
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text('加载健康码...')
                  ],
                );
              case FutureStatus.rejected:
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '加载健康码失败',
                        style: TextStyle(color: Colors.red),
                      ),
                      RaisedButton(
                        child: const Text('点击重试'),
                        onPressed: onRefresh,
                      )
                    ]);
              case FutureStatus.fulfilled:
                return RefreshIndicator(
                  onRefresh: onRefresh,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 49),
                    children: <Widget>[
                      Container(
                        margin: EdgeInsetsDirectional.only(top: 40),
                        child: Center(
                          child: Observer(
                            builder: (_) => Text(_certStore.currentCountDown
                                .map((countDown) => '${countDown}s')
                                .orElse('')),
                          ),
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
                );
            }
          },
        );
      });

  Widget observeQrImage() {
    return Observer(builder: (BuildContext context) {
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
