import 'package:decimal/decimal.dart';
import 'package:mobx/mobx.dart';
import 'package:tw_wallet_ui/global/service/api_provider.dart';
import 'package:tw_wallet_ui/models/transaction.dart';
import 'package:tw_wallet_ui/models/tx_status.dart';

part 'tx_list_store.g.dart';

class TxListStore = _TxListStore with _$TxListStore;

abstract class _TxListStore with Store {
  final ApiProvider _client = ApiProvider();
  static const FIXED_DECIMAL = 2;

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

  String parseStatus(TxStatus status) {
    final s = {
      TxStatus.succeeded: "成功",
      TxStatus.transferring: "处理中",
      TxStatus.failed: "失败",
    }[status];
    return s;
  }

  String parseDate(DateTime dateTime) {
    return "${dateTime.day.toString()} ${_month(dateTime.month)} ${dateTime
        .year}";
  }

  String _month(int m) {
    assert(m >= 1 && m <= 12);
    return [
      "Jan.",
      "Feb.",
      "Mar.",
      "Apr.",
      "May",
      "June",
      "July",
      "Aug.",
      "Sept.",
      "Oct.",
      "Nov.",
      "Dec."
    ][m - 1];
  }


  String parseAmount(Decimal num) {
    final isNegative = num.isNegative;
    final str = num.toStringAsFixed(FIXED_DECIMAL);
    return isNegative ? str : "+" + str;
  }

  @action
  Future fetchDetails(String hash) =>
      tx = ObservableFuture(_client.fetchTxDetails(txHash: hash));
}
