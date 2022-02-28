import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';

class TransferRowWidget extends StatelessWidget {
  final String title;
  final String errorMsg;
  final Widget child;

  const TransferRowWidget(
      {required this.title, required this.errorMsg, required this.child});

  Widget buildLabel() {
    return Container(
      height: 43,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          if (title == null)
            Container()
          else
            Text(
              title,
              style: TextStyle(
                fontSize: 10,
                color: WalletTheme.rgbColor('#aaaaaa'),
              ),
            ),
          if (errorMsg == null)
            Container()
          else
            SizedBox(
              width: 200,
              child: Align(
                alignment: Alignment.bottomRight,
                child: errorMsg is Widget
                    ? errorMsg as Widget
                    : Text(
                        '* $errorMsg',
                        style: TextStyle(
                          fontSize: 10,
                          color: WalletTheme.rgbColor('#dd5757'),
                        ),
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
      padding: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(color: WalletTheme.rgbColor('#fafafa')),
      child: Row(
        children: <Widget>[
          Expanded(child: child),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[buildLabel(), buildContent()],
    );
  }
}
