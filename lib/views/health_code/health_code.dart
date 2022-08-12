import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/models/health_certification_token.dart';
import 'package:tw_wallet_ui/models/identity/decentralized_identity.dart';
import 'package:tw_wallet_ui/store/health_certification_store.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/views/health_code/health_code_store.dart';
import 'package:tw_wallet_ui/widgets/avatar.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';

class HealthCodePage extends StatefulWidget {
  final String id;
  final FirstRefreshState firstRefresh;

  @override
  State<StatefulWidget> createState() => HealthCodeState();

  const HealthCodePage(this.id, this.firstRefresh);
}

class HealthCodeState extends State<HealthCodePage> {
  final HealthCertificationStore certStore = Get.find();
  late HealthCodeStore _certStore;

  DecentralizedIdentity? identity;

  HealthCodeState();

  Future onRefresh() async {
    return _certStore.fetchLatestHealthCode();
  }

  @override
  void initState() {
    super.initState();
    identity = Get.find<IdentityStore>().getIdentityById(widget.id);
    _certStore = HealthCodeStore(identity!.did, 60, widget.firstRefresh);
  }

  @override
  void dispose() {
    _certStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) {
          final ScreenUtil screenUtil = ScreenUtil();
          final num avatarWidth = screenUtil.setWidth(70);
          final ObservableFuture<void> future =
              _certStore.fetchHealthCodeStream.value!;

          return CommonLayout(
            title: '健康码',
            // ignore: missing_return
            child: Observer(
              builder: (_) {
                switch (future.status) {
                  case FutureStatus.rejected:
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '加载健康码失败',
                            style: TextStyle(color: WalletColor.white),
                          ),
                          ElevatedButton(
                            onPressed: onRefresh,
                            child: const Text('点击重试'),
                          )
                        ],
                      ),
                    );
                  case FutureStatus.pending:
                  case FutureStatus.fulfilled:
                    return RefreshIndicator(
                      color: WalletColor.primary,
                      onRefresh: onRefresh,
                      child: ListView(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              left: screenUtil.setWidth(24),
                              right: screenUtil.setWidth(24),
                              top: screenUtil.setHeight(20),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: avatarWidth / 2),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      bottom: screenUtil.setHeight(91),
                                    ),
                                    decoration: BoxDecoration(
                                      color: WalletColor.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: screenUtil.setWidth(20),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: avatarWidth / 2 +
                                                  screenUtil.setHeight(20),
                                            ),
                                            child: Center(
                                              child: Text(
                                                identity!.profileInfo.name,
                                                style: WalletFont.font_18(
                                                  textStyle: const TextStyle(
                                                    letterSpacing: 0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: screenUtil.setHeight(28),
                                            ),
                                            child: Center(
                                              child: observeQrImage(
                                                screenUtil.setWidth(200),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: screenUtil.setHeight(28),
                                            ),
                                            child: Center(
                                              child: Text(
                                                _certStore.currentCountDown
                                                    .map(
                                                      (countDown) =>
                                                          '$countDown s',
                                                    )
                                                    .orElse(''),
                                                style: WalletFont.font_14(
                                                  textStyle: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: screenUtil.setHeight(28),
                                            ),
                                            child: Divider(
                                              color: WalletColor.grey,
                                              height: 1,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: screenUtil.setHeight(32),
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  '绿码：',
                                                  textAlign: TextAlign.left,
                                                  style: WalletFont.font_14(
                                                    textStyle: TextStyle(
                                                      color: WalletColor.green,
                                                      letterSpacing: 0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    '截止到当前，该身份的持有者没有暴露在病毒污染的环境中。',
                                                    textAlign: TextAlign.left,
                                                    style: WalletFont.font_14(
                                                      textStyle: TextStyle(
                                                        color:
                                                            WalletColor.green,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: screenUtil.setHeight(20),
                                            ),
                                            child: Row(
                                              children: <Widget>[
                                                Text(
                                                  '红码：',
                                                  textAlign: TextAlign.left,
                                                  style: WalletFont.font_14(
                                                    textStyle: TextStyle(
                                                      color: WalletColor.red,
                                                      letterSpacing: 0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    '该身份的持有者有病毒污染暴露风险。',
                                                    textAlign: TextAlign.left,
                                                    style: WalletFont.font_14(
                                                      textStyle: TextStyle(
                                                        color: WalletColor.red,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  child: AvatarWidget(width: avatarWidth),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                }
              },
            ),
          );
        },
      );

  Widget observeQrImage(double width) {
    return Observer(
      builder: (BuildContext context) {
        return certStore.currentToken
            .map(
              (token) => _buildQrImage(
                encodeQRData(token),
                certStore.isHealthy,
                width,
              ),
            )
            .orElse(Container());
      },
    );
  }

  String encodeQRData(HealthCertificationToken token) {
    return json.encode(token.toJson());
  }

  Widget _buildQrImage(String data, bool isHealth, double width) {
    final color = isHealth ? WalletColor.green : WalletColor.red;
    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(border: Border.all(color: color)),
      child: QrImage(data: data, foregroundColor: color),
    );
  }
}
