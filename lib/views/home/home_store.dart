import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:tw_wallet_ui/common/env.dart';
import 'package:tw_wallet_ui/models/identity.dart';
import 'package:tw_wallet_ui/models/tw_point.dart';

part 'home_store.g.dart';

enum AssetsType { point, token }

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final dio = Dio()
    ..options.baseUrl = API_GATEWAY_BASE_URL
    ..options.connectTimeout = API_GATEWAY_CONNECT_TIMEOUT;

  @observable
  ObservableFuture<Identity> currentIdentity;

  @observable
  ObservableFuture<TwPoint> latestPointFuture;

  @action
  Future getCurrentIdentity() =>
      currentIdentity = ObservableFuture(Identity.getFromSecureStorage());

  @action
  Future fetchLatestPoint() =>
      latestPointFuture = ObservableFuture(currentIdentity
          .then((identity) => fetchPoint(dio: dio, address: identity.address)));

  void loadAssets(AssetsType type) {
    if (currentIdentity == null) {
      getCurrentIdentity();
    }

    if (type == AssetsType.point && latestPointFuture == null) {
      fetchLatestPoint();
    }
  }
}
