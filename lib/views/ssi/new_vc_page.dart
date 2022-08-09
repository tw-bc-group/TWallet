import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/service/progress_dialog.dart';
import 'package:tw_wallet_ui/store/apply_vc_info_store.dart';
import 'package:tw_wallet_ui/widgets/avatar.dart';
import 'package:tw_wallet_ui/widgets/error_row.dart';
import 'package:tw_wallet_ui/widgets/hint_dialog.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';

class NewVcPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewVcPageState();
}

class _NewVcPageState extends State<NewVcPage> {
  bool isAdding = false;
  final ApplyVcInfoStore store = Get.find();
  final ProgressDialog _dialog = Get.find();

  @override
  void initState() {
    super.initState();
    store.setErrorResetDispatchers();
  }

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  bool btnDisabled() {
    return store.name.isEmpty || store.phone.isEmpty;
  }

  Future<void> _addOnPressed() async {
    store.validateAll();
    if (!store.error.hasErrors && !isAdding) {
      isAdding = true;
      _dialog.show();
      await store.applyNewVc().then((success) {
        store.clearError();
        _dialog.dismiss();
        if (success as bool) {
          showDialogSimple(DialogType.success, '申请成功')
              .then((_) => Application.router.pop(context));
        }
        isAdding = false;
      });
    }
  }

  InputDecoration buildInputDecoration({
    required String assetIcon,
    required String labelText,
    required String hintText,
  }) {
    return InputDecoration(
      icon: SvgPicture.asset(assetIcon),
      labelText: labelText,
      labelStyle:
          WalletFont.font_14(textStyle: TextStyle(color: WalletColor.grey)),
      hintText: hintText,
      counterText: '',
      border: InputBorder.none,
    );
  }

  Widget buildInputField({
    required Widget textFieldChild,
    required String errorText,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(child: textFieldChild),
                ],
              ),
            ],
          ),
          Container(
            height: 1,
            color: errorText.isNotEmpty
                ? WalletColor.accent
                : WalletColor.middleGrey,
            margin: const EdgeInsets.only(top: 6),
          ),
          if (errorText.isNotEmpty) ErrorRowWidget(errorText: errorText)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => CommonLayout(
        title: '个人信息',
        bottomBackColor: WalletColor.white,
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(40),
              alignment: Alignment.center,
              child: const AvatarWidget(width: 80),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  color: WalletColor.white,
                ),
                child: Form(
                  child: ListView(
                    children: <Widget>[
                      buildInputField(
                        textFieldChild: TextField(
                          maxLength: 16,
                          keyboardType: TextInputType.text,
                          onChanged: (String value) =>
                              store.name = value.trim(),
                          decoration: buildInputDecoration(
                            assetIcon: 'assets/icons/name.svg',
                            labelText: '姓名*',
                            hintText: '输入姓名',
                          ),
                        ),
                        errorText: store.error.username ?? '',
                      ),
                      buildInputField(
                        textFieldChild: TextField(
                          onChanged: (value) => store.phone = value,
                          keyboardType: TextInputType.phone,
                          decoration: buildInputDecoration(
                            assetIcon: 'assets/icons/phone.svg',
                            labelText: '手机*',
                            hintText: '输入手机号',
                          ),
                        ),
                        errorText: store.error.phone ?? '',
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 100),
                        child: WalletTheme.button(
                          text: '确定申请VC',
                          onPressed:
                              btnDisabled() || isAdding ? null : _addOnPressed,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
