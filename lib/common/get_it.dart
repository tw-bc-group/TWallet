import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:tw_wallet_ui/common/http/http_client.dart';
import 'package:tw_wallet_ui/service/api_provider.dart';
import 'package:tw_wallet_ui/service/smart_contract/contract.dart';
import 'package:tw_wallet_ui/store/env_store.dart';
import 'package:tw_wallet_ui/store/health_certification_store.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/store/mnemonics.dart';

GetIt getIt = GetIt.instance;

class MockHttpClient extends Mock implements HttpClient {}

void getItInit({@required bool isTest}) {
  WidgetsFlutterBinding.ensureInitialized();

  getIt.registerSingletonAsync<EnvStore>(EnvStore.init);

  if (isTest) {
    getIt.registerSingleton<HttpClient>(MockHttpClient());

    getIt.registerSingletonWithDependencies<ApiProvider>(() => ApiProvider(),
        dependsOn: [EnvStore, MockHttpClient]);
  } else {
    getIt.registerSingletonWithDependencies<HttpClient>(() => HttpClient(),
        dependsOn: [EnvStore]);

    getIt.registerSingletonWithDependencies<ApiProvider>(() => ApiProvider(),
        dependsOn: [EnvStore, HttpClient]);

    getIt.registerSingletonAsync<MnemonicsStore>(MnemonicsStore.init);
    getIt.registerSingletonAsync<ContractService>(ContractService.init,
        dependsOn: [EnvStore, ApiProvider]);
    getIt.registerSingletonAsync<IdentityStore>(IdentityStore.init);
    getIt.registerSingletonWithDependencies<HealthCertificationStore>(
        () => HealthCertificationStore(),
        dependsOn: [EnvStore]);
  }
}
