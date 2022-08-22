import 'package:flutter/widgets.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';
import 'package:tw_wallet_ui/widgets/page_title.dart';

class Web3authLoginPage extends StatefulWidget {
  @override
  State<Web3authLoginPage> createState() => _Web3authLoginPageState();
}

class _Web3authLoginPageState extends State<Web3authLoginPage> {
  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      bodyBackColor: WalletColor.white,
      backIcon: BackIcon.none,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: WalletTheme.button(text: 'Login'),
          )
        ],
      ),
    );
  }
}
