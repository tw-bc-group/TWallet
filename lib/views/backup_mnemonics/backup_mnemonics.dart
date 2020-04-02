import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/theme.dart';
import 'package:tw_wallet_ui/views/backup_mnemonics/widgets/tips.dart';
import './widgets/page_title.dart';

class BackupMnemonicsPage extends StatelessWidget {
  final words = [
    'couple',
    'open',
    'atom',
    'good',
    'inflict',
    'shadow',
    'allow',
    'creek',
    'pave',
    'miss',
    'indicate',
    'broken'
  ];

  Widget buildWords() {
    List<Widget> wordWidgets = [];
    for (var word in words) {
      wordWidgets.add(Container(
          padding: EdgeInsets.all(10),
          child: Text(
            word,
            style: new TextStyle(
              fontSize: 20,
              color: WalletTheme.rgbColor('#38508c'),
            ),
          )));
    }
    return new Wrap(children: wordWidgets);
  }

  @override
  Widget build(BuildContext context) {
    Widget wordsWidget = buildWords();
    return new Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                ListView(
                  children: <Widget>[
                    PageTitle(),
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                        margin: EdgeInsets.only(top: 48),
                        decoration: BoxDecoration(
                            color: WalletTheme.rgbColor('#f6f8f9')),
                        child: wordsWidget),
                    Tips(),
                  ],
                ),
                Positioned(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 30),
                    width: MediaQuery.of(context).size.width - 60,
                    child: WalletTheme.flatButton(
                        text: '下一步',
                        onPressed: () {
                          Application.router
                              .navigateTo(context, 'confirm_mnemonics');
                        }),
                    decoration: WalletTheme.buttonDecoration(isEnabled: true),
                  ),
                  bottom: 60,
                  left: 0,
                )
              ],
            )));
  }
}
