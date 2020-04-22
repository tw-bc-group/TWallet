import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tw_wallet_ui/models/transaction.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/views/tx_list/store/tx_list_store.dart';
import 'package:tw_wallet_ui/views/tx_list/widgets/base_app_bar.dart';
import 'package:tw_wallet_ui/views/tx_list/widgets/tool_bar_panel.dart';
import 'package:tw_wallet_ui/views/tx_list/widgets/tx_list_item.dart';

import 'tx_list_details_page.dart';

class TxListPage extends StatefulWidget {
  const TxListPage();

  @override
  State createState() => _TxListPageState();
}

class _TxListPageState extends State<TxListPage> {
  final TxListStore store = TxListStore();

  void _onTap(Transaction item) {
    Navigator.pushNamed(context, Routes.txListDetails,
        arguments: TxListDetailsPageArgs(
          amount: store.parseAmount(item.amount),
          time: store.parseDate(item.createTime),
          status: store.parseStatus(item.txType),
          name: item.fromAddressName,
          fromAddress: item.fromAddress,
          toAddress: item.toAddress,
          fromAddressName: item.fromAddressName,
        ));
  }

  @override
  void initState() {
    store.fetchList("0xed9d02e382b34818e88B88a309c7fe71E65f419d");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildMainContent());
  }

  Widget _buildAppBar() {
    return baseAppBar(title: 'TW Points', bottom: _buildToolBarPanel());
  }

  Widget _buildAppBarTrailing() {
    return OutlineButton(
        borderSide: BorderSide(color: Color(0xFF3e71c0), width: 2),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0)),
        child: Text("转账",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF3e71c0))),
        onPressed: () {});
  }

  Widget _buildToolBarPanel() {
    return toolBarPanel(
        balance: "50.00",
        leading: Text("交易记录", style: TextStyle(color: Color(0xFF3e71c0))),
        trailing: _buildAppBarTrailing());
  }

  Widget _buildMainContent() {
    return Observer(builder: (context) {
//        return store.loading
//            ? CustomProgressIndicatorWidget()
//            : Material(child: _buildListView());
      return Material(child: _buildListView());
    });
  }

  Widget _buildListView() {
    final txList = store.list;
    return txList == null || txList.length == 0
        ? Center(child: Text("no content"))
        : ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: txList?.length == null ? 0 : txList?.length,
      itemBuilder: (BuildContext context, int index) {
        final item = txList[index];
        return Container(
          height: 70,
          child: TxListItem(item.fromAddress, item.txType, item.amount,
              item.createTime, () => _onTap(item)),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
      const Divider(),
    );
  }
}
