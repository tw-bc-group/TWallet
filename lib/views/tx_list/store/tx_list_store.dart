import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:tw_wallet_ui/global/service/api_provider.dart';
import 'package:tw_wallet_ui/models/transaction.dart';

part 'tx_list_store.g.dart';

class TxListStore = _TxListStore with _$TxListStore;

abstract class _TxListStore with Store {
  final ApiProvider _client = ApiProvider();

  @observable
  ObservableFuture<List<Transaction>> listFuture =
  ObservableFuture.value(new List<Transaction>());

  @observable
  ObservableFuture<Transaction> tx;

  @observable
  List<Transaction> list;

  @observable
  String errorMessage;

  @computed
  bool get loading => listFuture.status == FutureStatus.pending;

  @action
  Future fetchList(String myAddress) async {
    final future = _client.listTx(myAddress);
    listFuture = ObservableFuture(future);

    try {
      this.list = await future;
    } catch (e) {
      this.errorMessage = e.toString();
    }
  }



  @action
  Future fetchDetails(String hash) =>
      tx = ObservableFuture(_client.fetchTxDetails(txHash: hash));
}
