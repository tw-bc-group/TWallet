import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/models/identity.dart';

class IdentityQRPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Identity identity = ModalRoute.of(context).settings.arguments;
    print(identity);

    return Scaffold();
  }
}
