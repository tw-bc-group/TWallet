import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/models/identity/decentralized_identity.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/service/api_provider.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';

class IdentityBasicInfoWidget extends StatelessWidget {
  final IdentityStore identityStore = Get.find();
  final String id;
  final ApiProvider _apiProvider = Get.find();

  IdentityBasicInfoWidget({required this.id});

  void getPoints() {
    final DecentralizedIdentity? identity = identityStore.getIdentityById(id);
    _apiProvider.issuePoints(identity!.address);
  }

  @override
  Widget build(BuildContext context) {
    final DecentralizedIdentity? identity = identityStore.getIdentityById(id);

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: WalletColor.white,
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              top: 22,
              bottom: 24,
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '基本信息',
                  style: WalletFont.font_14(
                    textStyle: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                GestureDetector(
                  onTap: () => Application.router
                      .navigateTo(context, '${Routes.profile}?id=$id'),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '查看全部',
                        style: WalletFont.font_14(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: WalletColor.primary,
                          ),
                        ),
                      ),
                      SvgPicture.asset('assets/icons/right-arrow.svg')
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 1,
            color: WalletColor.middleGrey,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SvgPicture.asset('assets/icons/eye.svg'),
                        Container(
                          margin: const EdgeInsets.only(left: 10, right: 25),
                          child: Text(
                            'DID',
                            style: WalletFont.font_14(
                              textStyle: TextStyle(color: WalletColor.grey),
                            ),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          identity!.did.shorthandValue,
                          style: WalletFont.font_14(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  height: 1,
                  color: WalletColor.middleGrey,
                  margin: const EdgeInsets.only(top: 13, bottom: 21),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    Routes.qrPage,
                    arguments: identity,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SvgPicture.asset('assets/icons/qrcode.svg'),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Text(
                              '二维码名片',
                              style: WalletFont.font_14(
                                textStyle: TextStyle(color: WalletColor.grey),
                              ),
                            ),
                          )
                        ],
                      ),
                      SvgPicture.asset(
                        'assets/icons/right-arrow.svg',
                        color: WalletColor.grey,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  color: WalletColor.middleGrey,
                  margin: const EdgeInsets.only(top: 13, bottom: 21),
                ),
                GestureDetector(
                  onTap: getPoints,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SvgPicture.asset('assets/icons/get-points.svg'),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Text(
                              '获取 DC/EP',
                              style: WalletFont.font_14(
                                textStyle: TextStyle(color: WalletColor.grey),
                              ),
                            ),
                          )
                        ],
                      ),
                      Text(
                        '点击获取',
                        style: WalletFont.font_14(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: WalletColor.primary,
                          ),
                        ),
                      ),
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
