import 'package:flutter/widgets.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';
import 'package:tw_wallet_ui/widgets/page_title.dart';
import 'package:web3auth_flutter/web3auth_flutter.dart';

class Web3authLoginPage extends StatefulWidget {
  @override
  State<Web3authLoginPage> createState() => _Web3authLoginPageState();
}

class _Web3authLoginPageState extends State<Web3authLoginPage> {
  VoidCallback _login(
    BuildContext context,
    Future<Web3AuthResponse> Function() method,
  ) {
    return () async {
      try {
        final Web3AuthResponse response = await method();
        if (!mounted) return;
        Application.router.navigateTo(context, Routes.home);
      } on UserCancelledException {
        debugPrint("User cancelled.");
      } on UnKnownException {
        debugPrint("Unknown exception occurred");
      }
    };
  }

  Future<Web3AuthResponse> _withEmail() {
    return Web3AuthFlutter.login(
      provider: Provider.email_passwordless,
      mfaLevel: MFALevel.NONE,
    );
  }

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
            child: WalletTheme.button(
              text: 'Login',
              onPressed: _login(context, _withEmail),
            ),
          )
        ],
      ),
    );
  }
}
