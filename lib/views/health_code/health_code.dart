import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tw_wallet_ui/global/common/theme.dart';
import 'package:tw_wallet_ui/global/widgets/layouts/common_layout.dart';

class HealthCodePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HealthCodeState();
  }
}

class HealthCodeState extends State<HealthCodePage> {
  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      title: '健康码',
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 29),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsetsDirectional.only(top: 50),
              child: Center(
                child: Text(
                  '小钱',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: WalletTheme.rgbColor('#222222'),
                    height: 1.6
                  )
                ),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 50),
              child: QrImage(
                data: 'health_status',
                version: QrVersions.auto,
                size: 200,
                foregroundColor: Colors.green
              ),
            ),
            Container(
              width: 320,
              margin: EdgeInsetsDirectional.only(top: 50),
              child: Center(
                child: Text(
                  '绿码：截止到当前，该身份的持有者没有暴露在病毒污染的环境中。',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: 1.4,
                    color: WalletTheme.rgbColor('#888888'),
                    height: 1.43
                  ),
                )
              ),
            ),
            Container(
              width: 320,
              margin: EdgeInsetsDirectional.only(top: 20),
              child: Center(
                child: Text(
                  '红码：该身份的持有者有病毒污染暴露风险。',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: 1.4,
                    color: WalletTheme.rgbColor('#888888'),
                    height: 1.43
                  ),
                )
              ),
            )
          ],
        )
      )
    );
  }
}
