import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/global/common/theme/color.dart';
import 'package:tw_wallet_ui/global/common/theme/font.dart';
import 'package:tw_wallet_ui/global/common/theme/index.dart';
import 'package:tw_wallet_ui/global/store/identity_store.dart';
import 'package:tw_wallet_ui/global/widgets/avatar.dart';
import 'package:tw_wallet_ui/models/identity.dart';

import '../../../global/common/application.dart';
import '../../../router/routers.dart';

class IdentityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IdentityPageState();
}

class _IdentityPageState extends State<IdentityPage> {
  final IdentityStore _store = getIt<IdentityStore>();
  TextEditingController _filter;

  Widget _listItem(Identity identity) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: GestureDetector(
          onTap: () {
            Application.router.navigateTo(
                context, '${Routes.identityDetail}?id=${identity.id}');
          },
          child: Container(
              decoration: BoxDecoration(
                color: WalletTheme.listItemBgColor,
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2.0)],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: ListTile(
                    leading: AvatarWidget(avataaar: identity.avataaar),
                    title: Text(identity.name),
                    subtitle: GestureDetector(
                        child: Text(identity.did.toString()),
                        onLongPress: () {
                          Clipboard.setData(
                              ClipboardData(text: identity.address));
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content: new Text('"${identity.name}"地址已复制')));
                        }),
                  ))),
        ));
  }

  @override
  void initState() {
    _filter = TextEditingController();
    super.initState();
  }

  Widget buildHeader() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Center(child: Text(
              '身份',
              style: WalletFont.font_18(
                textStyle: TextStyle(
                  color: WalletTheme.rgbColor(WalletColor.white)
                )
              )
            )),
            Positioned(
              child: SvgPicture.asset(
                'assets/images/scan.svg',
                color: WalletTheme.rgbColor(WalletColor.white),
                width: 40,
                height: 40
              ),
              top: -10,
              right: 0,
            )
          ],
        )
        // TextField(
        //   controller: _filter,
        //   onChanged: (String value) => _store.updateSearchName(value),
        //   decoration: InputDecoration(
        //       prefixIcon: Icon(Icons.search), hintText: 'Search...'),
        // ),
      ],
    );
  }

  Widget buildNewIdentityCard() {
    if (_store.identities.length == 0) {
      return Container(
        padding: EdgeInsets.only(top: 68, bottom: 78, left: 84, right: 84),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Color(0x0f000000),
              offset: Offset(0,4),
              blurRadius: 12,
              spreadRadius: 0
            )
          ],
          color: WalletTheme.rgbColor(WalletColor.white),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage('assets/images/id-card.png')),
            Container(
              margin: EdgeInsets.only(top: 56),
              child: WalletTheme.button(
                text: '新增身份', onPressed: () => Application.router.navigateTo(context, Routes.newIdentity)
              ),
            )
          ],
        ),
      );
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: WalletTheme.rgbColor(WalletColor.primary),
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            alignment: Alignment.bottomCenter
          ),
        ),
        child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: buildHeader()
          ),
          Expanded(child: Observer(builder: (_) {
            return Container(
                padding: EdgeInsets.all(24),
                child: ListView(
                  children: _store.identities
                      .where((identity) =>
                          identity.name.contains(_store.searchName))
                      .map((identity) => _listItem(identity))
                      .toList() + [buildNewIdentityCard()],
                ));
          }))
        ]));
  }
}
