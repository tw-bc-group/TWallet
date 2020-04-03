import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/models/identity.dart';
import 'package:tw_wallet_ui/views/backup_mnemonics/backup_mnemonics.dart';
import 'package:tw_wallet_ui/views/confirm_mnemonics/confirm_mnemonics.dart';
import 'package:tw_wallet_ui/views/home/home_widget.dart';
import 'package:tw_wallet_ui/views/input_pin/input_pin_widget.dart';
import 'package:tw_wallet_ui/views/new_wallet/new_wallet_widget.dart';

var newWalletHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return NewWalletWidget();
  },
);

var homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomeWidget(
      identity: Identity.fromJson(json.decode(params['identity'][0])));
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
