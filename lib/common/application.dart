import 'package:fluro/fluro.dart';
import 'package:tw_wallet_ui/models/env.dart';

enum ENV {
  production,
  dev,
}

class Application {
  /// 通过Application设计环境变量
  static ENV env = ENV.dev;

  static Env globalEnv = Env.fromDefault();

  static String appName = '';

  static FluroRouter router = FluroRouter.appRouter;

  /// 所有获取配置的唯一入口
  Map<String, String> get config {
    if (Application.env == ENV.production) {
      return {};
    }
    if (Application.env == ENV.dev) {
      return {};
    }
    return {};
  }
}
