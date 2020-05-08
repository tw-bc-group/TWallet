import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/global/common/theme.dart';
import 'package:tw_wallet_ui/global/widgets/page_title.dart';

class CommonLayout extends StatelessWidget {

  final Widget child;
  final bool withBottomBtn;
  final String btnText;
  final Function btnOnPressed;
  final String title;
  final String bodyBackColor;
  final BackIcon backIcon;

  CommonLayout({
    this.child, 
    this.withBottomBtn = false,
    this.btnText = '完成',
    this.btnOnPressed,
    this.title,
    this.bodyBackColor = '#f2f2f2',
    this.backIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WalletTheme.rgbColor(bodyBackColor),
      appBar: AppBar(
        backgroundColor: WalletTheme.rgbColor('#fafafa'),
        brightness: Brightness.light,
        title: PageTitleWidget(title: title, backIcon: backIcon),
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
          decorationColor: Colors.black
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        titleSpacing: 0.0,
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Container(
          decoration: BoxDecoration(color: WalletTheme.rgbColor(bodyBackColor)),
          child: Column(
            children: <Widget>[
              Expanded(child: child),
              withBottomBtn ? Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                width: MediaQuery.of(context).size.width - 60,
                child: WalletTheme.button(
                  text: btnText,
                  onPressed: btnOnPressed
                ),
              ) : Container()
            ],
          )
        )
      ),
    );
  }
}
