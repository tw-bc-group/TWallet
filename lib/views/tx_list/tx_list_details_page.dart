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

  TxListDetailsPageArgs(
      {this.amount,
      this.fromAddressName,
      this.time,
      this.status,
      this.fromAddress,
      this.toAddress});
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

  Widget _buildButton(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: CupertinoButton(
          onPressed: () => Navigator.pop(context),
          child: Text("好的", style: TextStyle(fontSize: 20)),
          color: Color(0XFF3E71C0),
        ));
  }

  Widget _buildList(BuildContext context, TxListDetailsPageArgs args) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ..._buildLabelTextArea(
            label: "发送方",
            rows: [args.fromAddressName, args.fromAddress],
          ),
          SizedBox.fromSize(size: Size.fromHeight(40)),
          ..._buildLabelTextArea(label: "发送方", rows: [args.toAddress]),
          Expanded(child: Container()),
          _buildButton(context),
        ]);
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
