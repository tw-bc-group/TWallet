import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/mnemonics.dart';
import 'package:tw_wallet_ui/views/backup_mnemonics/widgets/tips.dart';
import 'package:tw_wallet_ui/widgets/hint_dialog.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';

import '../../generated/l10n.dart';

class BackupMnemonicsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BackupMnemonicsPageState();
}

class BackupMnemonicsPageState extends State<BackupMnemonicsPage> {
  final MnemonicsStore store = Get.find();

  @override
  void initState() {
    super.initState();
    store.brandNew();
  }

  Widget buildWords(MnemonicsStore mnemonics) {
    final List<String> words = store.mnemonics.split(' ');
    final List<Widget> wordWidgets = [];
    for (final String word in words) {
      wordWidgets.add(
        Container(
          margin: const EdgeInsets.all(12),
          child: Text(word, style: WalletFont.font_16()),
        ),
      );
    }
    return Wrap(children: wordWidgets);
  }

  Widget buildInfoTipButton() {
    return Positioned(
      top: -6,
      right: 0,
      child: GestureDetector(
        onTap: () => hintDialogHelper(
          context,
          DialogType.none,
          S.of(context).pageCreateWalletBackupHintDescription,
          title: S.of(context).pageCreateWalletBackupHintTitle,
        ),
        child: const Image(
          image: AssetImage('assets/images/info-black.png'),
          width: 40,
          height: 40,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      withBottomBtn: true,
      btnOnPressed: () =>
          Application.router.navigateTo(context, Routes.confirmMnemonics),
      btnText: S.of(context).pageCreateWalletBackupNext,
      bottomBackColor: WalletColor.white,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          color: WalletColor.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            ListView(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: Center(
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            S.of(context).pageCreateWalletBackupTitle,
                            style: WalletFont.font_20(),
                          ),
                        ),
                        buildInfoTipButton()
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: const Center(
                    child: Image(
                      image: AssetImage('assets/images/edit.png'),
                      width: 44,
                      height: 44,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  child: Text(
                    S.of(context).pageCreateWalletBackupDescriptionSecOne,
                    style: WalletFont.font_14(),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  S.of(context).pageCreateWalletBackupDescriptionSecTwo,
                  style: WalletFont.font_14(),
                  textAlign: TextAlign.center,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 24,
                  ),
                  margin: const EdgeInsets.only(top: 48),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    color: WalletColor.lightGrey,
                  ),
                  child: buildWords(store),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: Tips(
                      'Mnemonics are account credentials. To avoid account theft, please do not take screenshots'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
