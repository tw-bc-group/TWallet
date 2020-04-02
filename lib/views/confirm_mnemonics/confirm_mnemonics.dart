import 'package:flutter/material.dart';

import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/theme.dart';
import 'package:tw_wallet_ui/views/backup_mnemonics/widgets/page_title.dart';
import 'package:tw_wallet_ui/views/confirm_mnemonics/widgets/word_button.dart';

class ConfirmMnemonicsPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new ConfirmMnemonicsState();
  }
}

class ConfirmMnemonicsState extends State<ConfirmMnemonicsPage> {
  final words = ['couple', 'open', 'atom', 'good', 'inflict', 'shadow', 'allow', 'creek', 'pave', 'miss', 'indicate', 'broken'];
  final selectedWords = [];

  Widget buildWords() {
    List<Widget> wordWidgets = [];
    for (var word in selectedWords) {
      wordWidgets.add(
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
            word,
            style: new TextStyle(
              fontSize: 20,
              color: WalletTheme.rgbColor('#38508c'),
            ),
          )
        )
      );
    }
    return new Wrap(children: wordWidgets);
  }

  Widget buildWordButtons() {
    List<Widget> wordButtons = [];
    for(var word in words) {
      wordButtons.add(
        WordButton(
          text: word,
          onPressed: () {
            if (!selectedWords.contains(word)) {
              setState(() {
                selectedWords.add(word);
              });
            } else {
              var wordIndex = selectedWords.indexOf(word);
              setState(() {
                selectedWords.removeAt(wordIndex);
              });
            }
          }
        )
      );
    }
    return new Wrap(children: wordButtons);
  }

  @override
  Widget build(BuildContext context) {
    Widget wordsWidget = buildWords();
    Widget wordButtonsWidget = buildWordButtons();
    return new Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            ListView(
              children: <Widget>[
                PageTitle(title: '确认助记词', desc: '请按顺序点击下方助记词，确认您的正确备份'),
                ConstrainedBox(
                  constraints: BoxConstraints(minHeight: 200),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                    margin: EdgeInsets.only(top: 48, left: 30, right: 30),
                    decoration: BoxDecoration(color: WalletTheme.rgbColor('#f6f8f9')),
                    child: wordsWidget
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                  margin: EdgeInsets.only(top: 40),
                  child: wordButtonsWidget
                )
              ],
            ),
            Positioned(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                width: MediaQuery.of(context).size.width - 60,
                child: WalletTheme.flatButton(
                  text: '完成',
                  onPressed: () {
                    Application.router.navigateTo(context, 'confirm_mnemonics');
                  }
                ),
                decoration: WalletTheme.buttonDecoration(isEnabled: true),
              ),
              bottom: 60,
              left: 0,
            )
          ],
        )
      )
    );
  }
}
