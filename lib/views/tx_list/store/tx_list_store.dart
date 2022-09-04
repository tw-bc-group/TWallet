import 'package:mobx/mobx.dart';
import 'package:optional/optional.dart';
import 'package:tw_wallet_ui/models/transaction.dart';
import 'package:tw_wallet_ui/service/api_provider.dart';

part 'tx_list_store.g.dart';

class TxListStore = _TxListStore with _$TxListStore;

abstract class _TxListStore with Store {
  final ApiProvider _client = ApiProvider();

  @observable
  ObservableFuture<List<Transaction>> listFuture =
      ObservableFuture.value(<Transaction>[]);

  @observable
  late ObservableFuture<Optional<Transaction>> tx;

  @observable
  List<Transaction> list = [];

  @observable
  String? errorMessage = '';

  @computed
  bool get loading => listFuture.status == FutureStatus.pending;

  @action
  Future fetchList(String myAddress) async {
    final future = _client.fetchTxList(myAddress);

    listFuture = ObservableFuture(future);

    try {
      list = await future;
    } catch (e) {
      errorMessage = e.toString();
    }
  }

  @action
  Future fetchDetails(String hash) =>
      tx = ObservableFuture(_client.fetchTxDetails(txHash: hash));
}
