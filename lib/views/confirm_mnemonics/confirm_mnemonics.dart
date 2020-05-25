import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:more/tuple.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/service/dialog.dart';
import 'package:tw_wallet_ui/store/mnemonics.dart';
import 'package:tw_wallet_ui/views/confirm_mnemonics/widgets/word_button.dart';
import 'package:tw_wallet_ui/views/home/home.dart';
import 'package:tw_wallet_ui/widgets/layouts/new_common_layout.dart';
import 'package:tw_wallet_ui/widgets/page_title.dart';

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
          child: Text(tag.second, style: WalletFont.font_16())));
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

  Widget buildInfoTipButton() {
    return Positioned(
      child: GestureDetector(
        onTap: () => DialogService.showDialog(
            title: '备份提示',
            btnText: '知道了',
            body: Column(
              children: <Widget>[
                Text(
                  '使用纸和笔正确抄写助记词。',
                  style: WalletFont.font_14(),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '请勿将助记词告诉任何人，妥善保管至隔离网络的安全地方。',
                  style: WalletFont.font_14(),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '如果您的手机丢失、被盗、损坏，助记词可以恢复您的资产。',
                  style: WalletFont.font_14(),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            onPressed: () => DialogService.discardDialog()),
        child: Image(
            image: AssetImage('assets/images/info-black.png'),
            width: 40,
            height: 40),
      ),
      top: -6,
      right: 0,
    );
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

    return NewCommonLayout(
        backIcon: BackIcon.ARROW,
        withBottomBtn: true,
        btnText: '完成',
        btnOnPressed: buttonDisabled
            ? null
            : () async {
                store.save().then((_) => Application.router.navigateTo(
                    context, '/home?index=${HomeState.identityIndex}',
                    transition: TransitionType.native, clearStack: true));
              },
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              color: WalletColor.white),
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Center(
                    child: Stack(children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      '确认助记词',
                      style: WalletFont.font_20(),
                    ),
                  ),
                  buildInfoTipButton()
                ])),
              ),
              Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Text(
                    '-请按顺序点击下方助记词，确认您的正确备份-',
                    style: WalletFont.font_14(),
                    textAlign: TextAlign.center,
                  )),
              ConstrainedBox(
                constraints: BoxConstraints(minHeight: 200),
                child: Container(
                    margin: EdgeInsets.only(top: 24),
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 24),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: WalletColor.lightGrey),
                    child: buildWords()),
              ),
              Container(
                height: 1,
                margin: EdgeInsets.only(top: 24),
                color: WalletColor.middleGrey,
              ),
              Container(
                  margin: EdgeInsets.only(top: 14),
                  child: buildWordButtons(store))
            ],
          ),
        ));
  }
}
