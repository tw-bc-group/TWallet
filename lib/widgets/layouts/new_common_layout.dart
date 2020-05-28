import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/widgets/page_title.dart';

class NewCommonLayout extends StatelessWidget {
  final Widget child;
  final bool withBottomBtn;
  final String btnText;
  final VoidCallback btnOnPressed;
  final String title;
  final Color bodyBackColor;
  final BackIcon backIcon;
  final bool withBottomNavigationBar;
  final List<Widget> appBarActions;

  const NewCommonLayout(
      {this.child,
      this.withBottomBtn = false,
      this.btnText = '完成',
      this.btnOnPressed,
      this.title,
      this.bodyBackColor,
      this.backIcon = BackIcon.arrow,
      this.withBottomNavigationBar = true,
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
      bottomNavigationBar: Theme(
          data: Theme.of(context),
          child: Container(
              color: WalletColor.white,
              height: withBottomNavigationBar ? 30 : 0)),
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
                padding: withBottomNavigationBar
                    ? null
                    : const EdgeInsets.only(bottom: 30),
                child: Column(
                  children: <Widget>[
                    Expanded(child: child),
                    if (withBottomBtn)
                      Container(
                          color: WalletColor.white,
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 30),
                          child: WalletTheme.button(
                              text: btnText, onPressed: btnOnPressed))
                  ],
                ),
              ))),
    );
  }
}
