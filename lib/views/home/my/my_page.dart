import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/common/secure_storage.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/views/backup_mnemonics/widgets/tips.dart';

Future<void> _cleanPrivateData(BuildContext context) async {
  return getIt<IdentityStore>()
      .clear()
      .then((_) => SecureStorage.clearAll())
      .then((_) => Future.delayed(Duration(seconds: 1)).then((_) => Application
          .router
          .navigateTo(context, Routes.inputPin, clearStack: true)));
}

YYDialog showLoadingDialog() {
  return YYDialog().build()
    ..borderRadius = 12
    ..barrierColor = Colors.transparent
    ..backgroundColor = WalletColor.white
    ..width = 160
    ..height = 160
    ..widget(Container(
      width: 60,
      height: 60,
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 50),
      child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(WalletColor.primary)),
    ))
    ..show();
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenUtil = ScreenUtil();

    return Column(children: <Widget>[
      Container(
        height: _screenUtil.setHeight(244),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover)),
        child: Center(
            child: Text('我的',
                style: WalletFont.font_24(
                    textStyle: TextStyle(
                        color: WalletColor.white, letterSpacing: 1.2)))),
      ),
      Expanded(
          child: Container(
              color: WalletColor.lightGrey,
              child: Padding(
                padding: EdgeInsets.all(_screenUtil.setWidth(24)),
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () async {
                        YYDialog loadingDialog = showLoadingDialog();
                        await _cleanPrivateData(context);
                        loadingDialog.dismiss();
                      },
                      child: Container(
                          height: _screenUtil.setWidth(90),
                          decoration: BoxDecoration(
                            color: WalletColor.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x0f000000),
                                  offset: Offset(0, 4),
                                  blurRadius: 12,
                                  spreadRadius: 0)
                            ],
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: _screenUtil.setWidth(20)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('清除数据', style: WalletFont.font_18()),
                                  SvgPicture.asset(
                                      'assets/icons/right-arrow.svg')
                                ],
                              ),
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: _screenUtil.setWidth(24)),
                      child: Container(
                          height: _screenUtil.setWidth(44),
                          decoration: BoxDecoration(
                              color: Color(0x19ff5164),
                              borderRadius: BorderRadius.circular(8)),
                          child: Tips('将从此设备中删除所有钱包数据且无法恢复，请谨慎操作')),
                    )
                  ],
                ),
              )))
    ]);
  }
}
