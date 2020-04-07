import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/secure_storage.dart';
import 'package:tw_wallet_ui/common/theme.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/service/blockchain.dart';
import 'package:tw_wallet_ui/store/mnemonics.dart';
import 'package:tw_wallet_ui/views/backup_mnemonics/widgets/icon_back_button.dart';
import 'package:tw_wallet_ui/views/backup_mnemonics/widgets/page_title.dart';
import 'package:tw_wallet_ui/views/confirm_mnemonics/widgets/word_button.dart';

class ConfirmMnemonicsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ConfirmMnemonicsState();
  }
}

class ConfirmMnemonicsState extends State<ConfirmMnemonicsPage> {
  List<String> words = [];
  final selectedWords = [];

  Widget buildWords() {
    List<Widget> wordWidgets = [];
    for (var word in selectedWords) {
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

  Widget buildWordButtons(mnemonics) {
    List<Widget> wordButtons = [];
    for (var word in words) {
      wordButtons.add(WordButton(
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
          }));
    }
    return Wrap(children: wordButtons);
  }

  @override
  Widget build(BuildContext context) {
    final mnemonics = Provider.of<MnemonicsStore>(context);
    if (words.length == 0) {
      words = mnemonics.mnemonics.split(' ');
      words.shuffle();
    }
    var buttonDisabled = selectedWords.join(' ') != mnemonics.mnemonics;
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        body: Stack(
          children: [
            OverflowBox(
                child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(bottom: 110),
              child: ListView(
                children: <Widget>[
                  IconBackButton(),
                  PageTitle(title: '确认助记词', desc: '请按顺序点击下方助记词，确认您的正确备份'),
                  ConstrainedBox(
                    constraints: BoxConstraints(minHeight: 200),
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                        margin: EdgeInsets.only(top: 48, left: 30, right: 30),
                        decoration: BoxDecoration(
                            color: WalletTheme.rgbColor('#f6f8f9')),
                        child: buildWords()),
                  ),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      margin: EdgeInsets.only(top: 30),
                      child: buildWordButtons(mnemonics))
                ],
              ),
            )),
            Positioned(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                width: MediaQuery.of(context).size.width - 60,
                child: WalletTheme.flatButton(
                    text: '完成',
                    onPressed: buttonDisabled
                        ? null
                        : () async {
                            var identity = BlockChainService
                                .createRootKeyIdentityFromMnemonics(
                                    mnemonics.mnemonics);
                            var identityJsonStr = json.encode(identity);
                            await SecureStorage.set(
                                SecureStorageItem.Identity, identityJsonStr);
                            Application.router.navigateTo(
                                context,
                                Routes.home +
                                    '?identity=' +
                                    Uri.encodeComponent(identityJsonStr));
                          }),
                decoration: WalletTheme.buttonDecoration(isEnabled: true),
              ),
              bottom: 30,
              left: 0,
            )
          ],
        ));
  }
}
