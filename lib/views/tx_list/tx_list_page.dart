import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tw_wallet_ui/global/common/application.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/global/store/identity_store.dart';
import 'package:tw_wallet_ui/models/transaction.dart';
import 'package:tw_wallet_ui/models/tx_status.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/views/tx_list/store/tx_list_store.dart';
import 'package:tw_wallet_ui/views/tx_list/tx_list_details_page.dart';
import 'package:tw_wallet_ui/views/tx_list/utils/amount.dart';
import 'package:tw_wallet_ui/views/tx_list/utils/date.dart';
import 'package:tw_wallet_ui/views/tx_list/widgets/base_app_bar.dart';
import 'package:tw_wallet_ui/views/tx_list/widgets/tool_bar_panel.dart';
import 'package:tw_wallet_ui/views/tx_list/widgets/tx_list_item.dart';

class TxListPage extends StatefulWidget {
  const TxListPage();

  @override
  State createState() => _TxListPageState();
}

class _TxListPageState extends State<TxListPage> {
  final TxListStore store = TxListStore();
  final IdentityStore iStore = getIt<IdentityStore>();

  void _onTap(Transaction item) {
    final ie = _isExpense(item.fromAddress);
    Navigator.pushNamed(context, Routes.txListDetails,
        arguments: TxListDetailsPageArgs(
          amount: parseAmount(_amountWithSignal(ie, item.amount)),
          time: parseDate(item.createTime),
          status: statusNameCN(item.txType),
          fromAddress: item.fromAddress,
          toAddress: item.toAddress,
          fromAddressName: iStore.selectedName,
          isExpense: ie,
        ));
  }

  @override
  void initState() {
    print(iStore.myAddress);
    store.fetchList(iStore.myAddress);
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
        onPressed: () {
//          Application.router.navigateTo(context, '${Routes.transferTwPoints}?balance=$point')
          Application.router.navigateTo(context,
              '${Routes.transferTwPoints}?balance=${iStore.myBalance}');
        });
  }

  Widget _buildToolBarPanel() {
    return toolBarPanel(
        balance: parseAmount(Decimal.parse(iStore.myBalance), flag: false),
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

  bool _isExpense(String fromAddress) {
    return fromAddress == iStore.myAddress;
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
          child: TxListItem(
              _isExpense(item.fromAddress)
                  ? item.toAddress
                  : item.fromAddress,
              item.txType,
              _amountWithSignal(
                  _isExpense(item.fromAddress), item.amount),
              item.createTime,
                  () => _onTap(item),
              _isExpense(item.fromAddress)),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
      const Divider(),
    );
  }

  Decimal _amountWithSignal(bool isExpense, Decimal decimal) {
    return isExpense ? -decimal : decimal;
  }
}
