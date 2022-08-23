import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/web3auth_store.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';
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
        final web3AuthStore = Web3authStore(response.privKey);
        Get.put(web3AuthStore);
        if (!mounted) return;
        Application.router.navigateTo(context, Routes.home);
      } on UserCancelledException {
        debugPrint("User cancelled.");
      } on UnKnownException {
        debugPrint("Unknown exception occurred");
      }
    };
  }

  Future<Web3AuthResponse> _withGoogle() {
    return Web3AuthFlutter.login(
      provider: Provider.google,
      mfaLevel: MFALevel.DEFAULT,
    );
  }

  Future<Web3AuthResponse> _withFacebook() {
    return Web3AuthFlutter.login(
      provider: Provider.facebook,
      mfaLevel: MFALevel.DEFAULT,
    );
  }

  Future<Web3AuthResponse> _withGithub() {
    return Web3AuthFlutter.login(
      provider: Provider.github,
      mfaLevel: MFALevel.DEFAULT,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      bodyBackColor: WalletColor.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 25.0, horizontal: 12.0),
            child: WalletTheme.button(
              text: 'Login with Google',
              onPressed: _login(context, _withGoogle),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 25.0, horizontal: 12.0),
            child: WalletTheme.button(
              text: 'Login with Facebook',
              onPressed: _login(context, _withFacebook),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 25.0, horizontal: 12.0),
            child: WalletTheme.button(
              text: 'Login with Github',
              onPressed: _login(context, _withGithub),
            ),
          )
        ],
      ),
    );
  }
}
