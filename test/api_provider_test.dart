import 'package:flutter_test/flutter_test.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/global/service/api_provider.dart';
import 'package:tw_wallet_ui/models/transaction.dart';

void main() {
  getItInit(isTest: true);

  test("query tx list", () async {
    final ApiProvider provider = getIt<ApiProvider>();

    List<Transaction> list;
    try {
      list =
          await provider.listTx("0xed9d02e382b34818e88B88a309c7fe71E65f419d");
      print(list.first.hash);
    } catch (e) {
      print(e);
    }

    expect(list.length, equals(1));
  });
}
