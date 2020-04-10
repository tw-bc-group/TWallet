import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/views/backup_mnemonics/backup_mnemonics.dart';
import 'package:tw_wallet_ui/views/confirm_mnemonics/confirm_mnemonics.dart';
import 'package:tw_wallet_ui/views/home/home.dart';
import 'package:tw_wallet_ui/views/home/identity/identity_new_page.dart';
import 'package:tw_wallet_ui/views/input_pin/input_pin_widget.dart';
import 'package:tw_wallet_ui/views/new_wallet/new_wallet_widget.dart';

var newWalletHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return NewWalletWidget();
  },
);

var newIdentityHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return IdentityNewPage();
});

var homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  var index = (params['index'] ?? ['0']).first;
  return Home(defaultIndex: int.parse(index));
});

var inputPinHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return PinInputWidget();
  },
);

var backupMnemonicsHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return BackupMnemonicsPage();
  },
);

var confirmMnemonicsHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return ConfirmMnemonicsPage();
  },
);
