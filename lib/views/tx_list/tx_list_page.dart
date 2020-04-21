import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tw_wallet_ui/views/tx_list/store/tx_list_store.dart';
import 'package:tw_wallet_ui/views/tx_list/widgets/tx_list_item.dart';

class TxListPage extends StatefulWidget {
  const TxListPage();

  @override
  State createState() => _TxListPageState();
}

class _TxListPageState extends State<TxListPage> {
  final TxListStore store = TxListStore();

  void _onTap() {}

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
    return AppBar(
      title: Text('TW Points', style: TextStyle(color: Colors.black)),
      brightness: Brightness.light,
      backgroundColor: Colors.white,
    );
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
    return txList == null
        ? Center(child: Text("no content"))
        : ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: txList?.length == null ? 0 : txList?.length,
      itemBuilder: (BuildContext context, int index) {
        final item = txList[index];
        return Container(
          height: 70,
          child: TxListItem(item.fromAddress, item.txType, item.amount,
              item.createTime, _onTap),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
      const Divider(),
    );
  }
}
