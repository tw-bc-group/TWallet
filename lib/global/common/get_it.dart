import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tw_wallet_ui/global/store/identity_store.dart';

import 'env.dart';

GetIt getIt = GetIt.instance;

Future<void> getItInit() async {
  getIt.registerSingleton<Dio>(Dio()
    ..options.baseUrl = API_GATEWAY_BASE_URL
    ..options.connectTimeout = API_GATEWAY_CONNECT_TIMEOUT);

  var _identityStore = IdentityStore();
  await _identityStore.loadFromStorage();
  getIt.registerSingleton<IdentityStore>(_identityStore);
}
