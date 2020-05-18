import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:more/tuple.dart';
import 'package:tw_wallet_ui/global/common/application.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/global/common/theme/index.dart';
import 'package:tw_wallet_ui/global/store/mnemonics.dart';
import 'package:tw_wallet_ui/views/backup_mnemonics/widgets/icon_back_button.dart';
import 'package:tw_wallet_ui/views/backup_mnemonics/widgets/page_title.dart';
import 'package:tw_wallet_ui/views/confirm_mnemonics/widgets/word_button.dart';
import 'package:tw_wallet_ui/views/home/home.dart';

class ConfirmMnemonicsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ConfirmMnemonicsState();
  }
}

class ConfirmMnemonicsState extends State<ConfirmMnemonicsPage> {
  final store = getIt<MnemonicsStore>();
  final selectedWords = [];

  List<String> words = [];

  Widget buildWords() {
    List<Widget> wordWidgets = [];
    for (var tag in selectedWords) {
      wordWidgets.add(Container(
          padding: EdgeInsets.all(10),
          child: Text(
            tag.second,
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
    words.asMap().forEach((index, word) {
      wordButtons.add(WordButton(
          text: word,
          onPressed: () {
            Tuple2<int, String> tag = Tuple2(index, word);
            if (!selectedWords.contains(tag)) {
              setState(() {
                selectedWords.add(tag);
              });
            } else {
              var tagIndex = selectedWords.indexOf(tag);
              setState(() {
                selectedWords.removeAt(tagIndex);
              });
            }
          }));
    });
    return Wrap(children: wordButtons);
  }

  @override
  Widget build(BuildContext context) {
    if (words.length == 0) {
      words = store.mnemonics.split(' ');
      words.shuffle();
    }
    var buttonDisabled =
        selectedWords.map((tuple) => tuple.second).toList().join(' ') !=
            store.mnemonics;

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
                      child: buildWordButtons(store))
                ],
              ),
            )),
            Positioned(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                width: MediaQuery.of(context).size.width - 60,
                child: WalletTheme.button(
                    text: '完成',
                    onPressed: buttonDisabled
                        ? null
                        : () async {
                            store.save().then((_) => Application.router
                                .navigateTo(context,
                                    '/home?index=${HomeState.identityIndex}',
                                    transition: TransitionType.native));
                          }),
              ),
              bottom: 30,
              left: 0,
            )
          ],
        ));
  }
}
