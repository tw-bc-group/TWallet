import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/models/amount.dart';
import 'package:tw_wallet_ui/models/did.dart';
import 'package:tw_wallet_ui/models/tx_status.dart';
import 'package:tw_wallet_ui/views/tx_list/widgets/color_money_text.dart';
import 'package:tw_wallet_ui/views/tx_list/widgets/tx_info_card.dart';
import 'package:tw_wallet_ui/widgets/layouts/new_common_layout.dart';
import 'package:web3dart/credentials.dart';

class TxListDetailsPageArgs {
  final String amount;
  final String time;
  final TxStatus status;
  final String fromAddress;
  final String fromAddressName;
  final String toAddress;
  final bool isExpense;
  final Function onPressed;

  TxListDetailsPageArgs(
      {this.amount,
      this.fromAddressName,
      this.isExpense,
      this.time,
      this.status,
      this.fromAddress,
      this.toAddress,
      this.onPressed});
}

class TxListDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;

    return NewCommonLayout(
      title: '交易状态',
      withBottomNavigationBar: false,
      child: _buildMainContent(context, args),
    );
  }

  Container _buildMainContent(
      BuildContext context, TxListDetailsPageArgs args) {
    return Container(
      padding: EdgeInsets.all(24),
      child: ListView(
        children: <Widget>[
          _buildStatusCard(args),
          _buildTXInfoCard(args)
        ],
      ),
    );
  }

  Widget _buildStatusCard(TxListDetailsPageArgs args) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: WalletColor.white
      ),
      child: Column(
        children: <Widget>[
          ColorMoneyText(
            amount: Amount(Decimal.parse(args.amount)),
            status: args.status,
            isExpense: args.isExpense,
            textStyle: WalletFont.font_24(),
          ),
          Container(
            height: 1,
            color: WalletColor.middleGrey,
            margin: EdgeInsets.only(top: 30, bottom: 24),
          ),
          Text(
            '- ${args.status.toString()} -',
            style: WalletFont.font_16()
          ),
          Container(
            margin: EdgeInsets.only(top: 14),
            child: Text(
              args.status.getDesc(),
              style: WalletFont.font_14(),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTXInfoCard(TxListDetailsPageArgs args) {
    return Container(
      margin: EdgeInsets.only(top: 24),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: WalletColor.white
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 30),
                child: Text(
                  '交易时间',
                  style: WalletFont.font_14(
                    textStyle: TextStyle(
                      color: WalletColor.grey
                    )
                  )
                )
              ),
              Expanded(
                child: Text(
                  args.time,
                  style: WalletFont.font_14(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600
                    )
                  ),
                  textAlign: TextAlign.right,
                )
              )
            ],
          ),
          Container(
            height: 1,
            color: WalletColor.middleGrey,
            margin: EdgeInsets.symmetric(vertical: 20),
          ),
          TxInfoCardWidget(
            txInfoCardType: TxInfoCardType.Sender,
            name: args.fromAddressName,
            did: DID.fromEthAddress(EthereumAddress.fromHex(args.fromAddress)).toString()
          ),
          SizedBox(height: 20),
          TxInfoCardWidget(
            txInfoCardType: TxInfoCardType.Receiver,
            did: DID.fromEthAddress(EthereumAddress.fromHex(args.toAddress)).toString()
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, TxListDetailsPageArgs args) {
    return SizedBox(
        width: double.infinity,
        child: CupertinoButton(
          onPressed: args.onPressed == null
              ? () => Navigator.pop(context)
              : args.onPressed,
          child: Text("好的", style: TextStyle(fontSize: 20)),
          color: Color(0XFF3E71C0),
        ));
  }

  Widget _buildList(BuildContext context, TxListDetailsPageArgs args) {
    final ls = _labels(args.isExpense);
    final as = _address(args.isExpense, args.fromAddress, args.toAddress);

    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ..._buildLabelTextArea(
            label: ls.first,
            rows: [args.fromAddressName, as.first],
          ),
          SizedBox.fromSize(size: Size.fromHeight(40)),
          ..._buildLabelTextArea(label: ls.last, rows: [as.last]),
          Expanded(child: Container()),
          _buildButton(context, args),
        ]);
  }

  List<String> _labels(bool isExpense) {
    return isExpense ? ["发送方", "接收方"] : ["接收方", "发送方"];
  }

  List<String> _address(bool isExpense, String from, String to) {
    return isExpense ? [from, to] : [to, from];
  }

  Widget _buildAppBarHeaderInfo(TxListDetailsPageArgs args) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Column(
        children: <Widget>[
          Text(args.time),
          SizedBox.fromSize(size: Size.fromHeight(5)),
          // Text(args.status),
        ],
      ),
    );
  }

  List<Widget> _buildLabelTextArea({String label, List<String> rows}) {
    final margin = SizedBox.fromSize(size: Size.fromHeight(20));
    return <Widget>[
      ..._buildLabel(label),
      margin,
      ...rows.expand((e) => [Text(e, style: TextStyle(fontSize: 18)), margin]),
    ];
  }

  List<Widget> _buildLabel(String label) {
    return <Widget>[
      Text(label),
      Divider(),
    ];
  }
}
