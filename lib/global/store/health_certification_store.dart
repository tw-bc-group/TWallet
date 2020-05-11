import 'package:json_store/json_store.dart';
import 'package:mobx/mobx.dart';
import 'package:tw_wallet_ui/global/service/api_provider.dart';
import 'package:tw_wallet_ui/models/health_certification.dart';

part 'health_certification_store.g.dart';

class HealthCertificationStore = _HealthCertificationStore
    with _$HealthCertificationStore;

abstract class _HealthCertificationStore with Store {
  final _apiProvider = ApiProvider();
  final _db = JsonStore(dbName: "HealthCertification");

  @observable
  HealthCertification healthCertification;

  @observable
  bool isBoundCert = false;

  @computed
  bool get isHealthy => healthCertification?.sub?.healthyStatus?.val == HEALTHY;

  @action
  Future bindHealthCert(String did, String phone) async {
    final resp = await _apiProvider.healthCertificate(phone, did);
    await _db.setItem(did, resp.toJson());
    this.isBoundCert = true;
    this.healthCertification = resp;
    return Future.value(resp);
  }

  @action
  Future fetchHealthCert(String did) async {
    final cert = await _db.getItem(did);
    this.isBoundCert = cert != null ? true : false;
    if (this.isBoundCert) {
      this.healthCertification = HealthCertification.fromJson(cert);
    }
  }

  @action
  Future fetchLatestHealthCert(String did) async {
    var latestHealthCert = await _apiProvider.fetchHealthCertificate(did);
    await _db.setItem(did, latestHealthCert.toJson());
    this.healthCertification = latestHealthCert;
    return Future.value(latestHealthCert);
  }
}
