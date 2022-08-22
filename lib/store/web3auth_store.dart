import 'package:tw_wallet_ui/models/identity/account_info.dart';
import 'package:tw_wallet_ui/store/account_store.dart';
import 'package:web3auth_flutter/web3auth_flutter.dart';
import 'package:web3dart/credentials.dart';

Future<void> web3authInit() async {
  await Web3AuthFlutter.init(
    clientId:
        'BPEJFOrDMwJ5WvPhNyffgRSfjZKDiQfP-JRXkJ0Xn_VN-btJvaJdjH5xs7C9jJi-otu161s6j7z_Rlm4lpRLrao',
    network: Network.mainnet,
    redirectUri: 'com.thoughtworks.flutter.twallet://auth',
    whiteLabelData: WhiteLabelData(),
  );
}

class Web3authStore implements AccountStore {
  late final String privateKey;

  late final _credential = EthPrivateKey.fromHex(privateKey);

  @override
  // TODO: implement accountInfo
  Future<AccountInfo> get accountInfo => Future.value(
        AccountInfo(
          (acc) => acc
            ..index = 1
            ..address = _credential.address.toString()
            ..pubKey = _credential.encodedPublicKey.toString()
            ..priKey = privateKey,
        ),
      );

  @override
  Credentials get credentials => _credential;
}
