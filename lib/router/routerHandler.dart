import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:tw_wallet_ui/views/home/home_widget.dart';
import 'package:tw_wallet_ui/views/input_pin/input_pin_widget.dart';
import 'package:tw_wallet_ui/views/backup_mnemonics/backup_mnemonics.dart';
import 'package:tw_wallet_ui/views/confirm_mnemonics/confirm_mnemonics.dart';

var homeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new HomeWidget();
  },
);

var inputPinHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new PinInputWidget();
  },
);

var backupMnemonicsHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new BackupMnemonicsPage();
  },
);

var confirmMnemonicsHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new ConfirmMnemonicsPage();
  },
);
