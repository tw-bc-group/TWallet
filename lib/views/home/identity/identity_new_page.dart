import 'package:avataaar_image/avataaar_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tw_wallet_ui/global/common/theme.dart';
import 'package:tw_wallet_ui/views/home/identity/identity_new_store.dart';

class IdentityNewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IdentityNewPageState();
}

class _IdentityNewPageState extends State<IdentityNewPage> {
  final IdentityNewStore store = IdentityNewStore();

  @override
  void initState() {
    super.initState();
    store.setupValidators();
  }

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                color: WalletTheme.mainBgColor,
                child: Column(children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('新建个人信息',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      )),
                  Expanded(
                      child: Form(
                    child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          children: <Widget>[
                            AvataaarImage(
                              avatar: Avataaar(style: Style.circle),
                              errorImage: Icon(Icons.error),
                              placeholder: CircularProgressIndicator(),
                              width: 65,
                            ),
                            Padding(
                                padding: EdgeInsets.all(15),
                                child: Text('以下带 * 的为必填项',
                                    style: TextStyle(color: Colors.grey))),
                            Observer(
                                builder: (_) => TextField(
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) => store.name = value,
                                    decoration: InputDecoration(
                                      labelText: '名称*',
                                      hintText: '输入名称',
                                      errorText: store.error.username,
                                    ))),
                            Observer(
                                builder: (_) => TextField(
                                    onChanged: (value) => store.email = value,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      labelText: '邮箱',
                                      hintText: '输入邮箱',
                                      errorText: store.error.email,
                                    ))),
                            Observer(
                                builder: (_) => TextField(
                                    onChanged: (value) => store.phone = value,
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      labelText: '手机',
                                      hintText: '输入手机号',
                                      errorText: store.error.phone,
                                    ))),
                            Observer(
                                builder: (_) => TextField(
                                    onChanged: (value) =>
                                        store.birthday = value,
                                    keyboardType: TextInputType.datetime,
                                    decoration: InputDecoration(
                                      labelText: '生日',
                                      hintText: 'YYYY-MM-DD',
                                      errorText: store.error.birthday,
                                    ))),
                            Expanded(child: Container()),
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 55),
                                child: WalletTheme.button(
                                    text: '添加', onPressed: () {}))
                          ],
                        )),
                  ))
                ]))));
  }
}
