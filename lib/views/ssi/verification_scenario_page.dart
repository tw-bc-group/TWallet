import 'package:flutter/cupertino.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';

class VerificationScenarioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const String name = "测试场景";

    return CommonLayout(
      title: '需验证凭证',
      withBottomBtn: true,
      bodyBackColor: WalletColor.white,
      btnText: "确定并生成二维码",
      btnOnPressed: () => Application.router
          .navigateTo(context, Routes.verificationScenarioQrPage,
              routeSettings: const RouteSettings(
                arguments: name,
              )),
    );
  }
}
