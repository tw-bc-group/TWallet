import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/global/common/theme.dart';
import 'package:tw_wallet_ui/global/widgets/page_title.dart';

class CommonLayout extends StatelessWidget {

  final Widget child;
  final bool withBottomBtn;
  final String btnText;
  final Function btnOnPressed;

  CommonLayout({
    this.child, 
    this.withBottomBtn = false,
    this.btnText = '完成',
    this.btnOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WalletTheme.rgbColor('#f2f2f2'),
      appBar: AppBar(
        backgroundColor: WalletTheme.rgbColor('#fafafa'),
        brightness: Brightness.dark,
        title: PageTitleWidget(title: '转账给其他人'),
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
          decoration: BoxDecoration(color: WalletTheme.rgbColor('#f2f2f2')),
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