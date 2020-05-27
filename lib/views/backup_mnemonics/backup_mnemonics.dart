import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/mnemonics.dart';
import 'package:tw_wallet_ui/views/backup_mnemonics/widgets/tips.dart';
import 'package:tw_wallet_ui/widgets/hint_dialog.dart';
import 'package:tw_wallet_ui/widgets/layouts/new_common_layout.dart';
import 'package:tw_wallet_ui/widgets/page_title.dart';

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
          margin: EdgeInsets.all(12),
          child: Text(word, style: WalletFont.font_16())));
    }
    return Wrap(children: wordWidgets);
  }

  Widget buildInfoTipButton() {
    return Positioned(
      child: GestureDetector(
        child: Image(
            image: AssetImage('assets/images/info-black.png'),
            width: 40,
            height: 40),
        onTap: () => hintDialogHelper(context, DialogType.none,
            '使用纸和笔正确抄写助记词。\n请勿将助记词告诉任何人，妥善保管至隔离网络的安全地方。\n如果您的手机丢失、被盗、损坏，助记词可以恢复您的资产。',
            title: '备份提示'),
      ),
      top: -6,
      right: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    YYDialog.init(context);
    return NewCommonLayout(
        backIcon: BackIcon.ARROW,
        withBottomBtn: true,
        btnOnPressed: () =>
            Application.router.navigateTo(context, Routes.confirmMnemonics),
        btnText: '下一步',
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                color: WalletColor.white),
            padding: EdgeInsets.symmetric(horizontal: 24),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                ListView(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      child: Center(
                          child: Stack(children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            '备份助记词',
                            style: WalletFont.font_20(),
                          ),
                        ),
                        buildInfoTipButton()
                      ])),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 40),
                        child: Center(
                            child: Image(
                                image: AssetImage('assets/images/edit.png'),
                                width: 44,
                                height: 44))),
                    Container(
                      margin: EdgeInsets.only(top: 24),
                      child: Text('请用纸笔抄写下方助记词',
                          style: WalletFont.font_14(),
                          textAlign: TextAlign.center),
                    ),
                    Text('我们将在下一步验证',
                        style: WalletFont.font_14(),
                        textAlign: TextAlign.center),
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 24),
                        margin: EdgeInsets.only(top: 48),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: WalletColor.lightGrey),
                        child: buildWords(store)),
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: Tips('助记词为账户凭证，为了避免账户被盗，请勿截图'),
                    ),
                  ],
                ),
              ],
            )));
  }
}
