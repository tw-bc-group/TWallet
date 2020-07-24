import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/service/progress_dialog.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/store/mnemonics.dart';
import 'package:tw_wallet_ui/views/backup_mnemonics/widgets/tips.dart';
import 'package:tw_wallet_ui/widgets/hint_dialog.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';
import 'package:get/get.dart';

class RestoreMnemonicsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RestoreMnemonicsPageState();
}

class RestoreMnemonicsPageState extends State<RestoreMnemonicsPage> {
  final RxList<String> _inputWords = RxList([]);
  final RxBool _restoreFailed = false.obs;

  bool get _isValidInput => _inputWords.length == 12;

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
    final ScreenUtil _screenUtil = ScreenUtil();

    return Obx(() => CommonLayout(
        withBottomBtn: true,
        btnOnPressed: _isValidInput
            ? () async {
                final ProgressDialog _progressDialog = getIt<ProgressDialog>();
                _progressDialog.show();
                try {
                  final MnemonicsStore _mnemonicsStore =
                      getIt<MnemonicsStore>();
                  _mnemonicsStore.brandNew(mnemonics: _inputWords.join(' '));
                  getIt<IdentityStore>().restore().then((maxIndex) {
                    _mnemonicsStore.save(newIndex: maxIndex);
                  }).then((_) {
                    _progressDialog.dismiss();
                    Application.router
                        .navigateTo(context, Routes.home, clearStack: true);
                  });
                } catch (_) {
                  _restoreFailed.value = true;
                  _progressDialog.dismiss();
                }
              }
            : null,
        child: Container(
          decoration: BoxDecoration(
            color: WalletColor.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          ),
          child: ListView(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: Center(
                    child: Stack(children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text('输入助记词', style: WalletFont.font_20()),
                  ),
                  buildInfoTipButton()
                ])),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: _screenUtil.setWidth(40).toDouble(),
                    bottom: _screenUtil.setWidth(24).toDouble()),
                child: Center(
                    child: Text('-请按顺序输入您的助记词，按空格分隔-',
                        style: WalletFont.font_14())),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: _screenUtil.setWidth(24).toDouble()),
                child: Container(
                    height: _screenUtil.setHeight(162).toDouble(),
                    decoration: BoxDecoration(
                      color: WalletColor.lightGrey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: TextField(
                          autofocus: true,
                          style: WalletFont.font_16(
                              textStyle:
                                  const TextStyle(fontWeight: FontWeight.w600)),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          maxLength: 320,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp("[a-zA-Z ]"))
                          ],
                          decoration: const InputDecoration(
                              border: InputBorder.none, counterText: ''),
                          onChanged: (String value) => _inputWords.value = value
                              .trim()
                              .split(' ')
                              .where((e) => e.isNotEmpty)
                              .toList()),
                    )),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: _screenUtil.setWidth(24).toDouble()),
                  child: _restoreFailed.value
                      ? const Tips('恢复失败，请稍后再试')
                      : Container())
            ],
          ),
        )));
  }
}
