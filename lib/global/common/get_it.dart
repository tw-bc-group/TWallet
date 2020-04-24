import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:tw_wallet_ui/global/service/api_provider.dart';
import 'package:tw_wallet_ui/global/service/smart_contract/contract.dart';
import 'package:tw_wallet_ui/global/store/identity_store.dart';
import 'package:tw_wallet_ui/global/store/mnemonics.dart';

import 'env.dart';

GetIt getIt = GetIt.instance;

class MockDio extends Mock implements Dio {}

void getItInit({@required bool isTest}) {
  WidgetsFlutterBinding.ensureInitialized();

  if (isTest) {
    getIt.registerSingleton<Dio>(MockDio());
  } else {
    getIt.registerSingleton<Dio>(Dio()
      ..options.baseUrl = API_GATEWAY_BASE_URL
      ..options.connectTimeout = API_GATEWAY_CONNECT_TIMEOUT
      ..options.validateStatus = (statusCode) {
        switch (statusCode) {
          case 404:
          case 405:
          case 502:
            return false;
          default:
            return true;
        }
      }
      ..interceptors.add(InterceptorsWrapper(onResponse: (Response response) {
        print(response.statusCode);
        // print(response.data);
        return response;
      })));

    getIt
        .registerSingletonAsync<IdentityStore>(IdentityStoreBase.fromJsonStore);
    getIt.registerSingletonAsync<MnemonicsStore>(MnemonicsBase.init);
    getIt.registerSingletonAsync<ContractService>(ContractService.init);
  }

  getIt.registerSingleton<ApiProvider>(ApiProvider());
}
