import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/models/identity.dart';
import 'package:tw_wallet_ui/models/tw_point.dart';

part 'assets_store.g.dart';

enum AssetsType { point, token }

class AssetsStore = _AssetsStore with _$AssetsStore;

abstract class _AssetsStore with Store {
  final dio = getItGet<Dio>();

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
