import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/views/home/identity/identity_new_store.dart';
import 'package:tw_wallet_ui/widgets/layouts/new_common_layout.dart';
import 'package:tw_wallet_ui/widgets/page_title.dart';

class IdentityNewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IdentityNewPageState();
}

class _IdentityNewPageState extends State<IdentityNewPage> {
  bool isAdding = false;
  final IdentityNewStore store = IdentityNewStore();

  @override
  void initState() {
    super.initState();
    store.setupAvatarAndValidators();
  }

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  Future<void> _addOnPressed() async {
    store.validateAll();
    if (!store.error.hasErrors && !isAdding) {
      isAdding = true;
      Future.microtask(() {
        store.validateAll();
      }).then((_) {
        if (!store.error.hasErrors) {
          store.addIdentity().then((success) {
            if (success) {
              Application.router.pop(context);
            }
            isAdding = false;
          });
        }
      });
    }
  }

  InputDecoration buildInputDecoration({String assetIcon, String labelText, String hintText}) {
    return InputDecoration(
      icon: SvgPicture.asset(assetIcon),
      labelText: labelText,
      labelStyle: WalletFont.font_14(
        textStyle: TextStyle(
          color: WalletColor.grey
        )
      ),
      hintText: hintText,
      border: InputBorder.none,
    );
  }

  Widget buildInputField({Widget textFieldChild, String errorText}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      child: Column(
        children: <Widget>[
          Stack(children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(child: textFieldChild),
                Text(
                  '点击输入',
                  style: WalletFont.font_14(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600
                    )
                  )
                )
              ],
            ),
            if (errorText != null) Positioned(
              child: Text(
                errorText,
                style: WalletFont.font_12(
                  textStyle: TextStyle(
                    color: WalletColor.accent,
                  )
                ),
                textAlign: TextAlign.left
              ),
              left: 0,
              bottom: 0
            ),
          ]),
          Container(
            height: 1,
            color: WalletColor.middleGrey,
            margin: EdgeInsets.only(top: 6),
          ),
        ],
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => NewCommonLayout(
        backIcon: BackIcon.ARROW,
        title: '个人信息',
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(40),
              alignment: Alignment.center,
              child: Image(image: AssetImage('assets/images/avatar.png')),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12), topRight: Radius.circular(12)
                  ),
                  color: WalletColor.white
                ),
                child: Column(children: <Widget>[
                  Expanded(
                    child: Form(
                      child: Column(
                        children: <Widget>[
                          Observer(
                            builder: (_) => buildInputField(
                              textFieldChild: TextField(
                                keyboardType: TextInputType.text,
                                onChanged: (String value) =>
                                    store.name = value.trim(),
                                decoration: buildInputDecoration(
                                  assetIcon: 'assets/icons/name.svg',
                                  labelText: '名称*',
                                  hintText: '输入名称',
                                )
                              ),
                              errorText: store.error.username
                            )),
                          Observer(
                            builder: (_) => buildInputField(
                              textFieldChild: TextField(
                                onChanged: (value) =>
                                    store.email = value,
                                keyboardType:
                                    TextInputType.emailAddress,
                                decoration: buildInputDecoration(
                                  assetIcon: 'assets/icons/email.svg',
                                  labelText: '邮箱',
                                  hintText: '输入邮箱',
                                )
                              ),
                              errorText: store.error.email
                            )),
                          Observer(
                            builder: (_) => buildInputField(
                              textFieldChild: TextField(
                                onChanged: (value) =>
                                    store.phone = value,
                                keyboardType: TextInputType.phone,
                                decoration: buildInputDecoration(
                                  assetIcon: 'assets/icons/phone.svg',
                                  labelText: '手机',
                                  hintText: '输入手机号',
                                )
                              ),
                              errorText: store.error.phone
                            )),
                          Observer(
                            builder: (_) => buildInputField(
                              textFieldChild: TextField(
                                onChanged: (value) =>
                                    store.birthday = value,
                                keyboardType: TextInputType.datetime,
                                decoration: buildInputDecoration(
                                  assetIcon: 'assets/icons/birth.svg',
                                  labelText: '生日',
                                  hintText: 'YYYY-MM-DD',
                                )
                              ),
                              errorText: store.error.birthday
                            )),
                        ],
                      ),
                    )
                  ),
                  WalletTheme.button(
                    text: '确定创建身份',
                    onPressed: store.error.hasErrors || isAdding ? null : _addOnPressed,
                    buttonType: ButtonType.OUTLINE
                  )
                ]))
            )
          ],
        ),
      ),
    );
  }
}
