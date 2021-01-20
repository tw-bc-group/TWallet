import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/views/home/assets/home_list_item.dart';
import 'package:tw_wallet_ui/views/home/assets/home_list_view.dart';

class TicketTab extends StatelessWidget {
  const TicketTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeListView(
      children: [
        HomeListItem(
          leading: Text(
            '窖藏酒证',
            style: TextStyle(
              fontFamily: 'OpenSans',
              color: Color(0xff111111),
              fontSize: 16,
              fontWeight: FontWeight.w800,
              fontStyle: FontStyle.normal,
              letterSpacing: 0,
            ),
          ),
          trailing: Text(
            '0x86pl***',
            style: TextStyle(
              fontFamily: 'PingFangSC',
              color: Color(0xff4200d4),
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              letterSpacing: 0,
            ),
          ),
        ),
      ],
    );
  }
}
