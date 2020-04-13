import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:optional/optional_internal.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/global/store/identity_store.dart';
import 'package:tw_wallet_ui/models/identity.dart';
import 'package:tw_wallet_ui/models/tw_point.dart';

part 'assets_store.g.dart';

enum AssetsType { point, token }

class AssetsStore = _AssetsStore with _$AssetsStore;

abstract class _AssetsStore with Store {
  final _dio = getIt<Dio>();
  final _identityStore = getIt<IdentityStore>();

  @observable
  ObservableFuture<Optional<Identity>> currentIdentity;

  @observable
  ObservableFuture<Optional<TwPoint>> latestPointFuture;

  @computed
  Future get getCurrentIdentity => currentIdentity =
      ObservableFuture(Future.value(_identityStore.currentIdentity));

  @action
  Future<Optional<TwPoint>> fetchLatestPoint() =>
      latestPointFuture = ObservableFuture(currentIdentity.then((res) => res
          .map((identity) => fetchPoint(dio: _dio, address: identity.address)
              .then((point) => Optional.of(point)))
          .orElse(Future.value(Optional.empty()))));

  void loadAssets(AssetsType type) {
    if (currentIdentity == null) {
      getCurrentIdentity;
    }

    if (type == AssetsType.point && latestPointFuture == null) {
      fetchLatestPoint();
    }
  }
}
