import 'package:avataaar_image/avataaar_image.dart';
import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/global/common/theme.dart';
import 'package:tw_wallet_ui/views/identity_detail/widgets/detail_row.dart';
import 'package:tw_wallet_ui/views/identity_detail/widgets/page_title.dart';

class IdentityDetailPage extends StatelessWidget {
  final String id;

  IdentityDetailPage({this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WalletTheme.rgbColor('#fafafa'),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 0),
          child: Column(
            children: <Widget>[
              PageTitleWidget(title: '个人信息'),
              DetailRowWidget(
                name: '头像',
                value: AvataaarImage(
                  avatar: Avataaar(style: Style.circle),
                  errorImage: Icon(Icons.error),
                  placeholder: CircularProgressIndicator(),
                  width: 40,
                ),
              ),
              DetailRowWidget(
                name: '名称*',
                value: '小钱'
              ),
              DetailRowWidget(
                name: '邮箱',
                value: '55@qq.com'
              ),
              DetailRowWidget(
                name: '电话',
                value: '12345678901'
              ),
              DetailRowWidget(
                name: '生日',
                value: 'YYYY-MM-DD'
              ),
              DetailRowWidget(
                name: 'DID',
                value: 'z1ZTMeq4FQziibgsBewAaMwssf73BVsdf5y4jx'
              ),
              DetailRowWidget(
                value: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 70,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    child: Center(
                      child: Text(
                        '实名认证',
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).primaryColor
                        ),
                      ),
                    ),
                  )
                )
              ),
            ],
          )
        ),
      )
    );
  }
}
