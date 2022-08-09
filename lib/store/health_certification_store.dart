import 'package:get/get.dart';
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
  final ApiProvider _apiProvider = Get.find();
  final _db = JsonStore(dbName: "HealthCertificationToken");

  @observable
  Optional<HealthCertificationToken> currentToken = const Optional.empty();

  @computed
  bool get isBoundCert => currentToken.isPresent;

  @computed
  bool get isHealthy => currentToken
      .map(
        (token) => token.healthCertification.sub.healthyStatus.val == healthy,
      )
      .orElse(false);

  //TODO
  @action
  Future<Optional<HealthCertificationToken>> bindHealthCert(
    String did,
    String phone,
    double temperature,
    String contact,
    String symptoms,
  ) async {
    return _apiProvider
        .healthCertificate(did, phone, temperature, contact, symptoms)
        .then((res) {
      res.ifPresent((newToken) async => _db.setItem(did, newToken.toJson()));
      currentToken = res;
      return Future.value(res);
    });
  }

  @action
  Future fetchHealthCertByDID(String did) async {
    currentToken = Optional.ofNullable(await _db.getItem(did))
        .map((token) => HealthCertificationToken.fromJson(token));
  }

  //TODO
  @action
  Future<Optional<HealthCertificationToken>> fetchLatestHealthCert(
    String did,
  ) async {
    return _apiProvider.fetchHealthCertificate(did).then((res) {
      res.ifPresent((token) => _db.setItem(did, token.toJson()));
      currentToken = res;
      return Future.value(currentToken);
    });
  }

  Future<void> clear() async {
    currentToken = const Optional.empty();
    return _db.clearDataBase();
  }
}
