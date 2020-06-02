import 'package:mobx/mobx.dart';
import 'package:package_info/package_info.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/models/env.dart';

part 'env_store.g.dart';

Env globalEnv() => getIt.get<EnvStore>().env;
String appName() => getIt.get<EnvStore>().packageInfo.appName;

class EnvStore extends _EnvStore with _$EnvStore {
  EnvStore(PackageInfo info) {
    env = Env.fromDefault();
    packageInfo = info;
  }

  static Future<EnvStore> init() async {
    return PackageInfo.fromPlatform()
        .then((packageInfo) => EnvStore(packageInfo));
  }
}

abstract class _EnvStore with Store {
  @observable
  Env env;

  @observable
  PackageInfo packageInfo;
}
