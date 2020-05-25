import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';

class IdentityBasicInfoWidget extends StatelessWidget {
  final IdentityStore identityStore = getIt<IdentityStore>();
  final String id;

  IdentityBasicInfoWidget({this.id});

  @override
  Widget build(BuildContext context) {
    var identity = identityStore.getIdentityById(id);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: WalletColor.white
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 22, bottom: 24, left: 20, right: 20),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '基本信息',
                  style: WalletFont.font_14(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600
                    )
                  )
                ),
                GestureDetector(
                  onTap: () => Application.router.navigateTo(context, '${Routes.profile}?id=$id'),
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Text(
                          '查看全部',
                          style: WalletFont.font_14(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: WalletColor.primary
                            )
                          )
                        ),
                        SvgPicture.asset('assets/icons/right-arrow.svg')
                      ],
                    )
                  ),
                )
              ],
            )
          ),
          Container(
            height: 1,
            color: WalletColor.middleGrey,
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset('assets/icons/eye.svg'),
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 25),
                            child: Text(
                              'DID',
                              style: WalletFont.font_14(
                                textStyle: TextStyle(
                                  color: WalletColor.grey
                                )
                              ),
                            )
                          )
                        ],
                      )
                    ),
                    Expanded(
                      child: Text(
                        identity.did.toString(),
                        style: WalletFont.font_14(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w600
                          )
                        )
                      ),
                    )
                  ],
                ),
                Container(
                  height: 1,
                  color: WalletColor.middleGrey,
                  margin: EdgeInsets.only(top: 13, bottom: 21),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, Routes.qrPage, arguments: identity),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            SvgPicture.asset('assets/icons/qrcode.svg'),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                '二维码名片',
                                style: WalletFont.font_14(
                                  textStyle: TextStyle(
                                    color: WalletColor.grey
                                  )
                                ),
                              )
                            )
                          ],
                        )
                      ),
                      SvgPicture.asset(
                        'assets/icons/right-arrow.svg',
                        color: WalletColor.grey,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}