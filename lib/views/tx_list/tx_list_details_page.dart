import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tw_wallet_ui/views/tx_list/widgets/base_app_bar.dart';

class TxListDetailsPageArgs {
  final String amount;
  final String time;
  final String status;
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

    return Scaffold(
      appBar: _buildAppBar(args),
      body: _buildMainContent(context, args),
    );
  }

  Widget _buildAppBar(TxListDetailsPageArgs args) {
    return baseAppBar(
        title: args.amount,
        bottom: PreferredSize(
          child: _buildAppBarHeaderInfo(args),
          preferredSize: Size.fromHeight(35),
        ));
  }

  Container _buildMainContent(
      BuildContext context, TxListDetailsPageArgs args) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 60),
      padding: EdgeInsets.all(20),
      child: _buildList(context, args),
    );
  }

  Widget _buildButton(BuildContext context, TxListDetailsPageArgs args) {
    return SizedBox(
        width: double.infinity,
        child: CupertinoButton(
          onPressed: args.onPressed == null ? () => Navigator.pop(context) : args.onPressed,
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
    return isExpense ? ["发送方", "接收方"] : [ "接收方", "发送方"];
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
          Text(args.status),
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
