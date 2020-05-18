import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/global/store/identity_store.dart';
import 'package:tw_wallet_ui/widgets/button.dart';


showDialogIfNoIdentity({BuildContext context, Function onPressed}) {
  final IdentityStore _identityStore = getIt<IdentityStore>();

  if (_identityStore.identities.isEmpty) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _showAddIdentityDialog(context, onPressed);
    });
  }
}

Future _showAddIdentityDialog(BuildContext context, Function onPressed) async {
  return await showDialog<String>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => new SimpleDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
      children: <Widget>[
        Center(
            child: Text(
              '您还没有添加身份，请前往\"身份\"页面添加身份',
              style: TextStyle(
                fontSize: 15,
                height: 1.82,
              ),
              textAlign: TextAlign.center,
            )),
        Container(
            margin: EdgeInsets.only(top: 48),
            child: Button(
              width: 100,
              height: 40,
              text: '确定',
              onPressed: onPressed,
            ))
      ],
    ),
  );
}