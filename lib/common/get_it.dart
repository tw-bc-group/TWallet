import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:tw_wallet_ui/common/http/http_client.dart';
import 'package:tw_wallet_ui/service/api_provider.dart';
import 'package:tw_wallet_ui/service/progress_dialog.dart';
import 'package:tw_wallet_ui/service/contract.dart';
import 'package:tw_wallet_ui/store/env_store.dart';
import 'package:tw_wallet_ui/store/health_certification_store.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/store/mnemonics.dart';

GetIt getIt = GetIt.instance;

class MockHttpClient extends Mock implements HttpClient {}

Future<void> getItInit({@required bool isTest}) async {
  WidgetsFlutterBinding.ensureInitialized();

  getIt.registerSingletonAsync<EnvStore>(() => EnvStore.init(isTest: isTest));
  getIt.registerLazySingleton<ProgressDialog>(() => ProgressDialog());

  if (isTest) {
    getIt.registerSingleton<HttpClient>(MockHttpClient());
    getIt.registerSingleton<ApiProvider>(ApiProvider());
  } else {
    getIt.registerSingletonWithDependencies<HttpClient>(() => HttpClient(),
        dependsOn: [EnvStore]);

    getIt.registerSingletonWithDependencies<ApiProvider>(() => ApiProvider(),
        dependsOn: [EnvStore, HttpClient]);

    getIt.registerSingleton<MnemonicsStore>(await MnemonicsStore.init());
    await getIt.isReady<ApiProvider>();
    await getIt.isReady<EnvStore>();
    final ContractService contractService = await ContractService.init();
    getIt.registerSingletonWithDependencies<ContractService>(
        () => contractService,
        dependsOn: [EnvStore, ApiProvider]);
    getIt.registerSingleton<IdentityStore>(await IdentityStore.init());
    getIt.registerSingletonWithDependencies<HealthCertificationStore>(
        () => HealthCertificationStore(),
        dependsOn: [EnvStore]);
  }
}
