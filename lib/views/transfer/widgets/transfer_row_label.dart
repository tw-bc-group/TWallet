import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/global/common/theme.dart';

class TransferRowWidget extends StatelessWidget {
  final String title;
  final String errorMsg;
  final Widget child;

  TransferRowWidget({this.title, this.errorMsg, this.child});

  Widget buildLabel() {
    return Container(
      height: 43,
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          title == null
              ? Container()
              : Text(
                  title,
                  style: TextStyle(
                      fontSize: 10, color: WalletTheme.rgbColor('#aaaaaa')),
                ),
          errorMsg == null
              ? Container()
              : Container(
                  width: 200,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: errorMsg is Widget
                        ? errorMsg
                        : Text(
                            '* ' + errorMsg,
                            style: TextStyle(
                                fontSize: 10,
                                color: WalletTheme.rgbColor('#dd5757')),
                          ),
                  ),
                )
        ],
      ),
    );
  }

  Widget buildContent() {
    return Container(
        height: 91,
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 0),
        decoration: BoxDecoration(color: WalletTheme.rgbColor('#fafafa')),
        child: Row(
          children: <Widget>[
            Expanded(child: child),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[buildLabel(), buildContent()],
    );
  }
}
