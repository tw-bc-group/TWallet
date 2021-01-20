import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/views/home/assets/home_list_item.dart';
import 'package:tw_wallet_ui/views/home/assets/home_list_view.dart';

class AssetTab extends StatelessWidget {
  const AssetTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeListView(
      children: [
        Container(
            padding: const EdgeInsets.only(bottom: 16),
            child: const Text(
              '数字货币',
              style: TextStyle(
                fontFamily: 'OpenSans',
                color: Color(0xff111111),
                fontSize: 16,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.normal,
                letterSpacing: 0,
              ),
            )),
        const HomeListItem(
          leading: Text(
            'BTC',
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
            '￥0.03',
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
        const HomeListItem(
          leading: Text(
            'ETH',
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
            '￥2.13',
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
        Divider(color: WalletColor.grey, height: 20),
        Container(
            padding: const EdgeInsets.only(bottom: 16),
            child: const Text(
              '房产证',
              style: TextStyle(
                fontFamily: 'OpenSans',
                color: Color(0xff111111),
                fontSize: 16,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.normal,
                letterSpacing: 0,
              ),
            )),
        const HomeListItem(
          leading: Text(
            '上海浦东***',
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
            '0x40b9***',
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
