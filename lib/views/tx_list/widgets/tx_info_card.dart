import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';

enum TxInfoCardType { sender, receiver }

final Map<TxInfoCardType, String> cardTypeTitleMap = {
  TxInfoCardType.sender: '发送方',
  TxInfoCardType.receiver: '接收方'
};

final Map<TxInfoCardType, Color> cardTypeBackColorMap = {
  TxInfoCardType.sender: WalletColor.yellowWhite,
  TxInfoCardType.receiver: WalletColor.identityCardBg
};

class TxInfoCardWidget extends StatelessWidget {
  final TxInfoCardType txInfoCardType;
  final String name;
  final String did;

  const TxInfoCardWidget({this.txInfoCardType, this.name, this.did});

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        padding:
            const EdgeInsets.only(top: 44, left: 20, right: 20, bottom: 12),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: cardTypeBackColorMap[txInfoCardType]),
        child: Column(
          children: <Widget>[
            if (name != null)
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        margin: const EdgeInsets.only(right: 30),
                        child: Text('姓名',
                            style: WalletFont.font_12(
                                textStyle:
                                    TextStyle(color: WalletColor.grey)))),
                    Expanded(
                        child: Text(
                      name,
                      style: WalletFont.font_12(
                          textStyle:
                              const TextStyle(fontWeight: FontWeight.w600)),
                      textAlign: TextAlign.right,
                    ))
                  ]),
            if (name != null)
              Container(
                height: 1,
                margin: const EdgeInsets.only(top: 16, bottom: 7),
                color: WalletColor.middleGrey,
              ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(right: 30),
                      child: Text('DID',
                          style: WalletFont.font_12(
                              textStyle: TextStyle(color: WalletColor.grey)))),
                  Expanded(
                      child: Text(
                    did,
                    style: WalletFont.font_12(
                        textStyle:
                            const TextStyle(fontWeight: FontWeight.w600)),
                    textAlign: TextAlign.right,
                  ))
                ]),
          ],
        ),
      ),
      Positioned(
          top: 12,
          child: Row(
            children: <Widget>[
              Container(
                width: 8,
                height: 12,
                color: WalletColor.black,
                margin: const EdgeInsets.only(right: 12),
              ),
              Text(
                cardTypeTitleMap[txInfoCardType],
                style: WalletFont.font_14(
                    textStyle: const TextStyle(fontWeight: FontWeight.w600)),
              ),
            ],
          ))
    ]);
  }
}
