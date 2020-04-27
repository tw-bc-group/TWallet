import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:tw_wallet_ui/global/common/http/http.dart';
import 'package:tw_wallet_ui/global/service/api_provider.dart';
import 'package:tw_wallet_ui/global/service/smart_contract/contract.dart';
import 'package:tw_wallet_ui/global/store/identity_store.dart';
import 'package:tw_wallet_ui/global/store/mnemonics.dart';

GetIt getIt = GetIt.instance;

class MockDio extends Mock implements Dio {}

void getItInit({@required bool isTest}) {
  WidgetsFlutterBinding.ensureInitialized();

  if (isTest) {
    getIt.registerSingleton<Dio>(MockDio());
  } else {
    getIt.registerSingleton<Dio>(Http.init());

    getIt
        .registerSingletonAsync<IdentityStore>(IdentityStoreBase.fromJsonStore);
    getIt.registerSingletonAsync<MnemonicsStore>(MnemonicsBase.init);
    getIt.registerSingletonAsync<ContractService>(ContractService.init);
  }

  getIt.registerSingleton<ApiProvider>(ApiProvider());
}
