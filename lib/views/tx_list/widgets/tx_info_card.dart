import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';

enum TxInfoCardType {
  Sender,
  Receiver
}

final cardTypeTitleMap = {
  TxInfoCardType.Sender: '发送方',
  TxInfoCardType.Receiver: '接收方'
};

final cardTypeBackColorMap = {
  TxInfoCardType.Sender: WalletColor.yellowWhite,
  TxInfoCardType.Receiver: WalletColor.identityCardBg
};

class TxInfoCardWidget extends StatelessWidget {
  final TxInfoCardType txInfoCardType;
  final String name;
  final String did;

  TxInfoCardWidget({this.txInfoCardType, this.name, this.did});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 44, left: 20, right: 20, bottom: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: cardTypeBackColorMap[txInfoCardType]
          ),
          child: Column(
            children: <Widget>[
              if (txInfoCardType == TxInfoCardType.Sender)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 30),
                    child: Text(
                      '姓名',
                      style: WalletFont.font_12(
                        textStyle: TextStyle(
                          color: WalletColor.grey
                        )
                      )
                    )
                  ),
                  Expanded(
                    child: Text(
                      name,
                      style: WalletFont.font_12(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w600
                        )
                      ),
                      textAlign: TextAlign.right,
                    )
                  )
                ]
              ),
              if (txInfoCardType == TxInfoCardType.Sender)
              Container(
                height: 1,
                margin: EdgeInsets.only(top: 16, bottom: 7),
                color: WalletColor.middleGrey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 30),
                    child: Text(
                      'DID',
                      style: WalletFont.font_12(
                        textStyle: TextStyle(
                          color: WalletColor.grey
                        )
                      )
                    )
                  ),
                  Expanded(
                    child: Text(
                      did,
                      style: WalletFont.font_12(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w600
                        )
                      ),
                      textAlign: TextAlign.right,
                    )
                  )
                ]
              ),
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
                margin: EdgeInsets.only(right: 12),
              ),
              Text(
                cardTypeTitleMap[txInfoCardType],
                style: WalletFont.font_14(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w600
                  )
                ),
              ),
            ],
          )
        )
      ]
    );
  }
}