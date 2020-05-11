import 'package:mobx/mobx.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/models/env.dart';

part 'env_store.g.dart';

Env globalEnv() => getIt.get<EnvStore>().env;

class EnvStore = _EnvStore with _$EnvStore;

abstract class _EnvStore with Store {
  _EnvStore() {
    env = Env.fromDefault();
  }

  @observable
  Env env;

  @action
  void updateEnv(Env newEnv) {
    env = newEnv;
  }
}
