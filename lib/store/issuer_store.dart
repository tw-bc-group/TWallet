import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:tw_wallet_ui/models/issuer_response.dart';
import 'package:tw_wallet_ui/service/api_provider.dart';

part 'issuer_store.g.dart';

class IssuerStore = _IssuerStore
    with _$IssuerStore;

abstract class _IssuerStore with Store {
  List<IssuerResponse> _issuers;

  Future<void> setIssuer(IssuerResponse issuer) async {
    _issuers = issuers;
  }
  
  Future<void> fetchIssuers() {
    Get.find<ApiProvider>().fetchIssuers().then((res) {
      res.ifPresent((list) {
        _issuers = list;
      });
    });
    return Future.value();
  }

  List<IssuerResponse> get issuers => _issuers;
}
