import 'package:json_store/json_store.dart';
import 'package:mobx/mobx.dart';
import 'package:optional/optional.dart';
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

  @computed
  bool get isBoundCert => token != null;

  @computed
  bool get isHealthy =>
      token?.healthCertification?.sub?.healthyStatus?.val == healthy;

  @action
  Future<HealthCertificationToken> bindHealthCert(String did, String phone,
      double temperature, String contact, String symptoms) async {
    return _apiProvider
        .healthCertificate(did, phone, temperature, contact, symptoms)
        .then((newToken) {
      return _db.setItem(did, newToken.toJson()).then((_) {
        token = newToken;
        return Future.value(token);
      });
    });
  }

  @action
  Future fetchHealthCertByDID(String did) async {
    token = Optional.ofNullable(await _db.getItem(did))
        .map((token) => HealthCertificationToken.fromJson(token))
        .orElse(null);
  }

  @action
  Future<HealthCertificationToken> fetchLatestHealthCert(String did) async {
    return _apiProvider.fetchHealthCertificate(did).then((res) {
      return _db.setItem(did, res.toJson()).then((_) {
        token = res;
        return Future.value(token);
      });
    });
  }

  Future<void> clear() async {
    token = null;
    return _db.clearDataBase();
  }
}
