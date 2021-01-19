import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/views/home/assets/home_list_item.dart';
import 'package:tw_wallet_ui/views/home/assets/home_list_view.dart';

class CertificationTab extends StatelessWidget {
  const CertificationTab({Key key}) : super(key: key);

  void showCertification(String name) {
    const nameUrlMap = {
      'yanqian': 'https://cac-file.thoughtworks.cn/6ef1435323db384e04c2.png',
      'liujiwei': 'https://cac-file.thoughtworks.cn/98a7a5119e01e9ca4bc8.png'
    };
    YYDialog().build()
      ..borderRadius = 4
      ..margin = const EdgeInsets.symmetric(horizontal: 24, vertical: 144)
      ..width = 1000
      ..widget(CachedNetworkImage(
        placeholder: (context, url) => CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(WalletColor.primary)),
        imageUrl: nameUrlMap[name],
      ))
      ..show();
  }

  @override
  Widget build(BuildContext context) {
    return HomeListView(
      children: [
        GestureDetector(
            onTap: () => showCertification('yanqian'),
            child: const HomeListItem(
              leading: Text(
                'CAC',
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
                '0x249f***',
                style: TextStyle(
                  fontFamily: 'PingFangSC',
                  color: Color(0xff4200d4),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0,
                ),
              ),
            )),
        GestureDetector(
            onTap: () => showCertification('liujiwei'),
            child: const HomeListItem(
              leading: Text(
                '学历证书',
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
                '0x707e***',
                style: TextStyle(
                  fontFamily: 'PingFangSC',
                  color: Color(0xff4200d4),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0,
                ),
              ),
            ))
      ],
    );
  }
}
