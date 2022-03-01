// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tw_wallet_ui/common/device_info.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/widgets/error_row.dart';
import 'package:tw_wallet_ui/widgets/page_title.dart';

typedef BeforeDispose = Future<void> Function();

class CommonLayout extends StatelessWidget {
  final Widget child;
  final bool withBottomBtn;
  final String btnText;
  final VoidCallback btnOnPressed;
  final String title;
  final Color bodyBackColor;
  final Color bottomBackColor;
  final BackIcon backIcon;
  final BeforeDispose beforeDispose;
  final List<Widget> appBarActions;
  final String errorText;

  const CommonLayout(
      {this.child,
      this.withBottomBtn = false,
      this.btnText = '完成',
      this.btnOnPressed,
      this.title,
      this.bodyBackColor,
      this.bottomBackColor,
      this.beforeDispose,
      this.backIcon = BackIcon.arrow,
      this.errorText = '',
      this.appBarActions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: bodyBackColor ?? WalletColor.primary,
      appBar: AppBar(
        backgroundColor: WalletColor.primary,
        title: PageTitleWidget(
          title: title,
          backIcon: backIcon,
          appBarActions: appBarActions,
          beforeDispose: beforeDispose,
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        titleSpacing: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        toolbarTextStyle: Theme.of(context)
            .textTheme
            .apply(
              bodyColor: Colors.black,
              displayColor: Colors.black,
              decorationColor: Colors.black,
            )
            .bodyText2,
        titleTextStyle: Theme.of(context)
            .textTheme
            .apply(
              bodyColor: Colors.black,
              displayColor: Colors.black,
              decorationColor: Colors.black,
            )
            .headline6,
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
                if (errorText.isNotEmpty)
                  _bottomContainer(
                    child: ErrorRowWidget(errorText: errorText),
                  ),
                if (withBottomBtn)
                  _bottomContainer(
                    child: WalletTheme.button(
                      text: btnText,
                      onPressed: btnOnPressed,
                    ),
                  ),
                Container(
                  color: bottomBackColor,
                  height: DeviceInfo.isIphoneXSeries() ? 34 : 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomContainer({Widget child}) {
    return Container(
      color: WalletColor.white,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: child,
    );
  }
}
