import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/device_info.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/service/dapp.dart';
import 'package:tw_wallet_ui/widgets/page_title.dart';

class CommonLayout extends StatelessWidget {
  final Widget child;
  final bool withBottomBtn;
  final String btnText;
  final VoidCallback btnOnPressed;
  final String title;
  final Color bodyBackColor;
  final BackIcon backIcon;
  final List<Widget> appBarActions;

  const CommonLayout(
      {this.child,
      this.withBottomBtn = false,
      this.btnText = '完成',
      this.btnOnPressed,
      this.title,
      this.bodyBackColor,
      this.backIcon = BackIcon.arrow,
      this.appBarActions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: bodyBackColor ?? WalletColor.primary,
      appBar: AppBar(
        backgroundColor: WalletColor.primary,
        brightness: Brightness.dark,
        title: PageTitleWidget(
          title: title,
          backIcon: backIcon,
          appBarActions: appBarActions,
        ),
        textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.black,
            displayColor: Colors.black,
            decorationColor: Colors.black),
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        titleSpacing: 0.0,
      ),
      bottomNavigationBar:
          Theme(data: Theme.of(context), child: Container(height: 0)),
      // color: DeviceInfo.isIphoneXSeries() ? Colors.transparent : WalletColor.white,
      // height: DeviceInfo.isIphoneXSeries() ? 30 : 0)),
      body: GestureDetector(
          onTap: () {
            final FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: SafeArea(
              maintainBottomViewPadding: true,
              child: Container(
                margin: const EdgeInsets.all(0),
                child: Column(
                  children: <Widget>[
                    Expanded(child: Container(child: child)),
                    if (withBottomBtn)
                      Container(
                          color: WalletColor.white,
                          padding: EdgeInsets.symmetric(
                              vertical: DeviceInfo.isIphoneXSeries() ? 34 : 20,
                              horizontal: 30),
                          child: WalletTheme.button(
                              text: btnText, onPressed: btnOnPressed))
                  ],
                ),
              ))),
    );
  }
}
