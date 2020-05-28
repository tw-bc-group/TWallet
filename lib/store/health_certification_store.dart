import 'package:json_store/json_store.dart';
import 'package:mobx/mobx.dart';
import 'package:tw_wallet_ui/models/health_certification.dart';
import 'package:tw_wallet_ui/models/health_certification_token.dart';
import 'package:tw_wallet_ui/service/api_provider.dart';

part 'health_certification_store.g.dart';

class HealthCertificationStore = _HealthCertificationStore
    with _$HealthCertificationStore;

abstract class _HealthCertificationStore with Store {
  final _apiProvider = ApiProvider();
  final _db = JsonStore(dbName: "HealthCertificationToken");

  @observable
  HealthCertificationToken token;

  @observable
  bool isBoundCert = false;

  @computed
  bool get isHealthy =>
      token?.healthCertification?.sub?.healthyStatus?.val == healthy;

  @action
  Future<HealthCertificationToken> bindHealthCert(String did, String phone,
      double temperature, String contact, String symptoms) async {
    return _apiProvider
        .healthCertificate(did, phone, temperature, contact, symptoms)
        .then((token) {
      return _db.setItem(did, token.toJson()).then((_) {
        isBoundCert = true;
        token = token;
        return Future.value(token);
      });
    });
  }

  @action
  Future fetchHealthCertByDID(String did) async {
    final item = await _db.getItem(did);
    isBoundCert = item != null;
    if (isBoundCert) {
      token = HealthCertificationToken.fromJson(item);
    }
  }

  @action
  Future<HealthCertificationToken> fetchLatestHealthCert(String did) async {
    return _apiProvider.fetchHealthCertificate(did).then((token) {
      return _db.setItem(did, token.toJson()).then((_) {
        this.token = token;

        return Future.value(token);
      });
    });
  }

  Future<void> clear() async {
    return _db.clearDataBase();
  }
}
