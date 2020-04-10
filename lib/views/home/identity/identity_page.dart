import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/global/common/theme.dart';

class IdentityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IdentityPageState();
}

class _IdentityPageState extends State<IdentityPage> {
  TextEditingController _filter;

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
          Expanded(
            child: ListView(children: []),
          )
        ]));
  }
}
