import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/global/common/application.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/global/common/theme/index.dart';
import 'package:tw_wallet_ui/global/store/mnemonics.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/views/backup_mnemonics/widgets/icon_back_button.dart';
import 'package:tw_wallet_ui/views/backup_mnemonics/widgets/tips.dart';

import './widgets/page_title.dart';

class BackupMnemonicsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BackupMnemonicsPageState();
}

class BackupMnemonicsPageState extends State<BackupMnemonicsPage> {
  final store = getIt<MnemonicsStore>();

  @override
  void initState() {
    super.initState();
    store.refresh();
  }

  Widget buildWords(mnemonics) {
    var words = store.mnemonics.split(' ');
    List<Widget> wordWidgets = [];
    for (var word in words) {
      wordWidgets.add(Container(
          padding: EdgeInsets.all(10),
          child: Text(
            word,
            style: TextStyle(
              fontSize: 20,
              color: WalletTheme.rgbColor('#38508c'),
            ),
          )));
    }
    return Wrap(children: wordWidgets);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                ListView(
                  children: <Widget>[
                    IconBackButton(),
                    PageTitle(title: '备份助记词', desc: '请用纸笔抄写下助记词，我们将在下一步验证'),
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                        margin: EdgeInsets.only(top: 48),
                        decoration: BoxDecoration(
                            color: WalletTheme.rgbColor('#f6f8f9')),
                        child: buildWords(store)),
                    Tips(),
                  ],
                ),
                Positioned(
                  child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 30),
                      width: MediaQuery.of(context).size.width - 60,
                      child: WalletTheme.button(
                          text: '下一步',
                          onPressed: () {
                            Application.router
                                .navigateTo(context, Routes.confirmMnemonics);
                          })),
                  bottom: 30,
                  left: 0,
                )
              ],
            )));
  }
}
