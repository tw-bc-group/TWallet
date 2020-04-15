import 'package:avataaar_image/avataaar_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/global/common/theme.dart';
import 'package:tw_wallet_ui/global/store/identity_store.dart';
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

  Widget _avatarWidget(String avatar) {
    return avatar == null
        ? CircleAvatar(backgroundImage: AssetImage('assets/images/avatar.jpg'))
        : AvataaarImage(
            avatar: Avataaar.fromJson(avatar),
            errorImage: Icon(Icons.error),
            placeholder: CircularProgressIndicator(),
          );
  }

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
                      leading: _avatarWidget(identity.avatar),
                      title: Text(identity.name),
                      subtitle: Text(identity.did)))),
        ));
  }

  @override
  void initState() {
    _filter = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: WalletTheme.mainBgColor,
        child: Column(children: <Widget>[
          Container(
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('身份',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  TextField(
                    controller: _filter,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search), hintText: 'Search...'),
                  ),
                ],
              )),
          Expanded(child: Observer(builder: (_) {
            return Container(
                padding: EdgeInsets.all(18),
                child: ListView(
                  children: _store.identities
                      .map((identity) => _listItem(identity))
                      .toList(),
                ));
          }))
        ]));
  }
}
