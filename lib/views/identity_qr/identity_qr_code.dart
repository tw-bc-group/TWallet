import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/models/identity.dart';
import 'package:tw_wallet_ui/widgets/avatar.dart';
import 'package:tw_wallet_ui/widgets/layouts/new_common_layout.dart';

class IdentityQRPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Identity identity = ModalRoute.of(context).settings.arguments;
    print(identity);

    return NewCommonLayout(
      title: '身份二维码',
      withBottomNavigationBar: false,
      child: _buildMainContent(identity),
    );
  }

  Widget _buildMainContent(Identity identity) {
    return Container(
      margin: EdgeInsets.only(top: 15),
        child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: WalletColor.white
                ),
                margin: EdgeInsets.only(left: 18, right: 18, top: 40),
                padding: EdgeInsets.only(top: 74, bottom: 41, left: 60, right: 60),
                child: Column(
                  children: <Widget>[
                    Text(
                      identity.name,
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    _buildQRCode(identity.did.toString()),
                    Container(
                      height: 1,
                      margin: EdgeInsets.only(top: 60, bottom: 40),
                      color: WalletColor.middleGrey
                    ),
                    Text(
                      identity.did.toString(),
                      style: WalletFont.font_14(),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Positioned(
                child: Align(
                  alignment: Alignment.center,
                  child: AvatarWidget()
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildQRCode(String did) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: QrImage(
        data: did,
        version: QrVersions.auto,
//        size: 200.0,
      ),
    );
  }
}
