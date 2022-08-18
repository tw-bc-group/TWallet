import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magic_sdk/magic_sdk.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';
import 'package:tw_wallet_ui/widgets/page_title.dart';

class MagicLinkLoginPage extends StatefulWidget {
  @override
  State<MagicLinkLoginPage> createState() => _MagicLinkLoginPageState();
}

class _MagicLinkLoginPageState extends State<MagicLinkLoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final magic = Get.find<Magic>();

  Future loginFunction({required String email}) async {
    try {
      final did =
          await magic.auth.loginWithMagicLink(email: _emailController.text);
      if (!mounted) return;
      Application.router.navigateTo(context, Routes.home);
      debugPrint('did: $did');
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CommonLayout(
          bodyBackColor: WalletColor.white,
          backIcon: BackIcon.none,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Enter your email',
                          border: OutlineInputBorder(),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email address';
                          }
                          return null;
                        },
                        controller: _emailController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            loginFunction(email: _emailController.text);
                            debugPrint('Email: ${_emailController.text}');
                            magic.user.getIdToken().then(
                                  (idToken) => debugPrint('id Token: $idToken'),
                                );

                            magic.user.getMetadata().then(
                                  (metadata) => debugPrint(
                                    'metadata: ${metadata.issuer}, ${metadata.email}, ${metadata.publicAddress}',
                                  ),
                                );

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Check your email')),
                            );
                          }
                        },
                        child: const Text('Login'),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Get.find<Magic>().relayer
      ],
    );
  }
}
