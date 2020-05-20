import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/widgets/page_title.dart';

class CommonLayout extends StatelessWidget {
  final LayoutWidgetBuilder childBuilder;
  final bool withBottomBtn;
  final String btnText;
  final Function btnOnPressed;
  final String title;
  final String bodyBackColor;
  final BackIcon backIcon;

  CommonLayout({
    this.childBuilder,
    this.withBottomBtn = false,
    this.btnText = '完成',
    this.btnOnPressed,
    this.title,
    this.bodyBackColor = '#f2f2f2',
    this.backIcon = BackIcon.ARROW,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: WalletTheme.rgbColor(bodyBackColor),
      appBar: AppBar(
        backgroundColor: WalletTheme.rgbColor('#fafafa'),
        brightness: Brightness.light,
        title: PageTitleWidget(title: title, backIcon: backIcon),
        textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.black,
            displayColor: Colors.black,
            decorationColor: Colors.black),
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        titleSpacing: 0.0,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SafeArea(
            maintainBottomViewPadding: true,
            child: LayoutBuilder(
                builder: (context, constraints) => Container(
                    color: WalletTheme.rgbColor(bodyBackColor),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                              child: childBuilder(context, constraints),
                              flex: 10),
                          withBottomBtn
                              ? Container(
                                  padding: EdgeInsets.only(
                                      bottom: constraints.maxHeight / 20),
                                  width: constraints.maxWidth * 0.7,
                                  child: WalletTheme.button(
                                      text: btnText, onPressed: btnOnPressed),
                                )
                              : Container()
                        ],
                      ),
                    )))),
      ),
    );
  }
}
