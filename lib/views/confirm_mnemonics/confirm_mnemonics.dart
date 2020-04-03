import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hex/hex.dart';
import 'package:provider/provider.dart';
import 'package:bip32/bip32.dart' as bip32;
import 'package:bip39/bip39.dart' as bip39;
import "package:ethereum_address/ethereum_address.dart";

import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/secure_storage.dart';
import 'package:tw_wallet_ui/common/theme.dart';
import 'package:tw_wallet_ui/models/identity.dart';
import 'package:tw_wallet_ui/store/mnemonics.dart';
import 'package:tw_wallet_ui/views/backup_mnemonics/widgets/page_title.dart';
import 'package:tw_wallet_ui/views/confirm_mnemonics/widgets/word_button.dart';

class ConfirmMnemonicsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ConfirmMnemonicsState();
  }
}

class ConfirmMnemonicsState extends State<ConfirmMnemonicsPage> {
  List<String> words = [];
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

  Widget buildWordButtons(mnemonics) {
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
    final mnemonics = Provider.of<MnemonicsStore>(context);
    if (words.length == 0) {
      words = mnemonics.mnemonics.split(' ');
      words.shuffle();
    }
    var buttonDisabled = selectedWords.join(' ') != mnemonics.mnemonics;
    return Scaffold(
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
                    child: buildWords()
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                  margin: EdgeInsets.only(top: 40),
                  child: buildWordButtons(mnemonics)
                )
              ],
            ),
            Positioned(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                width: MediaQuery.of(context).size.width - 60,
                child: WalletTheme.flatButton(
                  text: '完成',
                  onPressed: buttonDisabled ? null : () async {
                    var seed = bip39.mnemonicToSeed(mnemonics.mnemonics);
                    var hdWallet = bip32.BIP32.fromSeed(seed);
                    var keypair = hdWallet.derivePath("m/44'/60'/0'/0/0");
                    var privateKey = keypair.toWIF();
                    var nodeNeutered = hdWallet.neutered();
                    var publicKey = nodeNeutered.publicKey;
                    var address = ethereumAddressFromPublicKey(publicKey);
                    var identity = new Identity(
                      name: '小钱',
                      priKey: privateKey,
                      pubKey: HEX.encode(publicKey),
                      address: address,
                    );
                    var identityJsonStr = json.encode(identity);
                    await SecureStorage.set(SecureStorageItem.Identity, identityJsonStr);
                    Application.router.navigateTo(context, '/');
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
