import 'package:get/get.dart';
import 'package:json_store/json_store.dart';
import 'package:mobx/mobx.dart';
import 'package:tw_wallet_ui/models/health_certification.dart';
import 'package:tw_wallet_ui/models/health_certification_token.dart';
import 'package:tw_wallet_ui/service/api_provider.dart';

part 'health_certification_store.g.dart';

class HealthCertificationStore = _HealthCertificationStore
    with _$HealthCertificationStore;

abstract class _HealthCertificationStore with Store {
  final ApiProvider _apiProvider = Get.find();
  final _db = JsonStore(dbName: "HealthCertificationToken");

  @observable
  HealthCertificationToken? currentToken;

  @computed
  bool get isBoundCert => currentToken == null;

  @computed
  bool get isHealthy =>
      currentToken?.healthCertification.sub.healthyStatus.val == healthy;

  //TODO
  @action
  Future<HealthCertificationToken> bindHealthCert(
    String did,
    String phone,
    double temperature,
    String contact,
    String symptoms,
  ) async {
    return _apiProvider
        .healthCertificate(did, phone, temperature, contact, symptoms)
        .then((newToken) {
      _db.setItem(did, newToken.toJson());
      currentToken = newToken;
      return newToken;
    });
  }

  @action
  Future fetchHealthCertByDID(String did) async {
    final token = await _db.getItem(did);
    if (token != null) {
      currentToken = HealthCertificationToken.fromJson(token);
    }
  }

  //TODO
  @action
  Future<HealthCertificationToken?> fetchLatestHealthCert(
    String did,
  ) async {
    return _apiProvider.fetchHealthCertificate(did).then((res) {
      res.ifPresent((token) {
        _db.setItem(did, token.toJson());
        currentToken = res.value;
      });
      return Future.value(currentToken);
    });
  }

  Future<void> clear() async {
    currentToken = null;
    return _db.clearDataBase();
  }
}
