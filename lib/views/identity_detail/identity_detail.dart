import 'package:flutter/cupertino.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/views/identity_detail/widgets/certificate_card.dart';
import 'package:tw_wallet_ui/views/identity_detail/widgets/identity_basic_info.dart';
import 'package:tw_wallet_ui/widgets/layouts/new_common_layout.dart';

class IdentityDetailPage extends StatelessWidget {
  final IdentityStore identityStore = getIt<IdentityStore>();
  final String id;

  IdentityDetailPage({this.id});

  @override
  Widget build(BuildContext context) {
    var identity = identityStore.getIdentityById(id);
    return NewCommonLayout(
      title: identity.name,
      withBottomNavigationBar: false,
      child: Container(
        margin: EdgeInsets.only(top: 24),
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: <Widget>[
            IdentityBasicInfoWidget(id: id),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Text(
                '- 认证 -',
                style: WalletFont.font_18(
                  textStyle: TextStyle(
                    color: WalletColor.white
                  )
                ),
                textAlign: TextAlign.center,
              ),
            ),
            CertificateCardWidget(
              title: '健康认证',
              route: '${Routes.certificate}?id=$id'
            )
          ],
        )
      ),
    );
  }
}