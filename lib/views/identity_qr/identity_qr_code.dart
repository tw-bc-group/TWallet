import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tw_wallet_ui/models/identity.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';

class IdentityQRPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Identity identity = ModalRoute.of(context).settings.arguments;
    print(identity);

    return CommonLayout(
      childBuilder: (context, constraints) => _buildMainContent(identity),
      title: '身份二维码',
    );
  }

  Widget _buildMainContent(Identity identity) {
    return Container(
      padding: EdgeInsets.only(top: 88, left: 28, right: 28),
      child: Column(
        children: <Widget>[
          Text(
            identity.name,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          _buildQRCode(identity.did.toString()),
          Text(
            identity.did.toString(),
            style: TextStyle(fontSize: 18, color: Color(0xff888888)),
          ),
        ],
      ),
    );
  }

  Widget _buildQRCode(String did) {
    return Container(
      margin: EdgeInsets.all(44),
      child: QrImage(
        data: did,
        version: QrVersions.auto,
//        size: 200.0,
      ),
    );
  }
}
