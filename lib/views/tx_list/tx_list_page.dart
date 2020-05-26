import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/models/amount.dart';
import 'package:tw_wallet_ui/models/transaction.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/views/tx_list/store/tx_list_store.dart';
import 'package:tw_wallet_ui/views/tx_list/tx_list_details_page.dart';
import 'package:tw_wallet_ui/views/tx_list/utils/date.dart';
import 'package:tw_wallet_ui/views/tx_list/widgets/tool_bar_panel.dart';
import 'package:tw_wallet_ui/views/tx_list/widgets/tx_list_item.dart';
import 'package:tw_wallet_ui/widgets/layouts/new_common_layout.dart';

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
          amount:
              _amountWithSignal(ie, item.amount.value).humanReadableWithSign,
          time: parseDate(item.createTime),
          status: item.txType.toString(),
          fromAddress: item.fromAddress,
          toAddress: item.toAddress,
          fromAddressName: iStore.myName,
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
    return NewCommonLayout(
      title: 'DC/EP',
      withBottomNavigationBar: false,
      child: Observer(
        builder: (context) => Column(
          children: <Widget>[
            buildHeader(),
            buildBody(),
            buildFooter()
          ],
        )
      )
    );
  }

  Widget buildHeader() {
    return Container(
      margin: EdgeInsets.only(top: 34),
      alignment: Alignment.center,
      child: Text(
        '￥50.00',
        style: WalletFont.font_24(
          textStyle: TextStyle(
            color: WalletColor.white
          )
        ),
      ),
    );
  }

  Widget buildBody() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 34),
        padding: EdgeInsets.only(left: 24, right: 24, top: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12)),
          color: WalletColor.white
        ),
        child: buildListView()
      ),
    );
  }

  Widget buildFooter() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: WalletTheme.button(
              text: '转账',
              onPressed: () {},
              buttonType: ButtonType.OUTLINE,
              outlineColor: WalletColor.white
            )
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: WalletTheme.button(
              text: '收款',
              onPressed: () {},
              buttonType: ButtonType.OUTLINE,
              outlineColor: WalletColor.white
            )
          )
        ],
      ),
    );
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
          Application.router.navigateTo(
              context, Uri.encodeFull('${Routes.transferTwPoints}'));
        });
  }

  Widget _buildToolBarPanel() {
    return toolBarPanel(
        //balance: Decimal.parse(iStore.myBalance), flag: false),
        balance: iStore.myBalance.humanReadableWithSymbol,
        leading: Text("交易记录", style: TextStyle(color: Color(0xFF3e71c0))),
        trailing: _buildAppBarTrailing());
  }

  Widget _buildMainContent() {
    return Observer(builder: (context) {
      return Material(child: buildListView());
    });
  }

  bool _isExpense(String fromAddress) {
    return fromAddress.toLowerCase() == iStore.myAddress.toLowerCase();
  }

  Widget buildListView() {
    final txList = store.list;
    
    if (txList == null || txList.length == 0) {
      return Center(child: Text("no content"));
    }

    return ListView.separated(
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
                  _isExpense(item.fromAddress), item.amount.value),
              item.createTime,
              () => _onTap(item),
              _isExpense(item.fromAddress)),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          const Divider(),
    );
  }

  Amount _amountWithSignal(bool isExpense, Decimal decimal) {
    return isExpense ? Amount(-decimal) : Amount(decimal);
  }
}
