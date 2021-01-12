import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:more/tuple.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/store/mnemonics.dart';
import 'package:tw_wallet_ui/views/confirm_mnemonics/widgets/word_button.dart';
import 'package:tw_wallet_ui/views/home/home.dart';
import 'package:tw_wallet_ui/widgets/hint_dialog.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';

class ConfirmMnemonicsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ConfirmMnemonicsState();
  }
}

class ConfirmMnemonicsState extends State<ConfirmMnemonicsPage> {
  final MnemonicsStore store = Get.find();
  final List<Tuple2<int, String>> selectedWords = [];

  List<String> words = [];

  Widget buildWords() {
    final List<Widget> wordWidgets = [];
    for (final Tuple2<int, String> tag in selectedWords) {
      wordWidgets.add(Container(
          padding: const EdgeInsets.all(10),
          child: Text(tag.second, style: WalletFont.font_16())));
    }
    return Wrap(children: wordWidgets);
  }

  Widget buildWordButtons(MnemonicsStore mnemonics) {
    final List<Widget> wordButtons = [];
    words.asMap().forEach((index, word) {
      wordButtons.add(WordButton(
          text: word,
          onPressed: () {
            final Tuple2<int, String> tag = Tuple2(index, word);
            if (!selectedWords.contains(tag)) {
              setState(() {
                selectedWords.add(tag);
              });
            } else {
              final tagIndex = selectedWords.indexOf(tag);
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
      top: -6,
      right: 0,
      child: GestureDetector(
        onTap: () => hintDialogHelper(context, DialogType.none,
            '使用纸和笔正确抄写助记词。\n请勿将助记词告诉任何人，妥善保管至隔离网络的安全地方。\n如果您的手机丢失、被盗、损坏，助记词可以恢复您的资产。',
            title: '备份提示'),
        child: const Image(
            image: AssetImage('assets/images/info-black.png'),
            width: 40,
            height: 40),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (words.isEmpty) {
      words = store.mnemonics.split(' ');
      words.shuffle();
    }
    final bool buttonDisabled =
        selectedWords.map((tuple) => tuple.second).toList().join(' ') !=
            store.mnemonics;

    return CommonLayout(
        withBottomBtn: true,
        btnOnPressed: buttonDisabled
            ? null
            : () async {
                return store.save().then((_) => Application.router.navigateTo(
                    context, '/home?index=${HomeState.identityIndex}',
                    transition: TransitionType.native, clearStack: true));
              },
        bottomBackColor: WalletColor.white,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              color: WalletColor.white),
          child: ListView(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: Center(
                    child: Stack(children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      '确认助记词',
                      style: WalletFont.font_20(),
                    ),
                  ),
                  buildInfoTipButton()
                ])),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: Text(
                    '-请按顺序点击下方助记词，确认您的正确备份-',
                    style: WalletFont.font_14(),
                    textAlign: TextAlign.center,
                  )),
              ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 200),
                child: Container(
                    margin: const EdgeInsets.only(top: 24),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 24),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        color: WalletColor.lightGrey),
                    child: buildWords()),
              ),
              Container(
                height: 1,
                margin: const EdgeInsets.only(top: 24),
                color: WalletColor.middleGrey,
              ),
              Container(
                  margin: const EdgeInsets.only(top: 14),
                  child: buildWordButtons(store))
            ],
          ),
        ));
  }
}
