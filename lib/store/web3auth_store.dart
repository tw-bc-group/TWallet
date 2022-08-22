import 'package:tw_wallet_ui/models/identity/account_info.dart';
import 'package:tw_wallet_ui/store/account_store.dart';
import 'package:web3auth_flutter/web3auth_flutter.dart';
import 'package:web3dart/credentials.dart';

Future<void> web3authInit() async {
  await Web3AuthFlutter.init(
    clientId:
        'BOX6rnr4ryi64ruyL-WBLvHIhu44BzUKwiyETZo0657ubAeer3kC55vzObEjPsn3PAkS_zlz4U42y79u3rw_aRs',
    network: Network.testnet,
    redirectUri: 'com.thoughtworks.flutter.twallet://auth',
    whiteLabelData: WhiteLabelData(),
  );
}

class Web3authStore implements AccountStore {
  late final String privateKey;

  late final EthPrivateKey _credential;

  Web3authStore(this.privateKey) {
    _credential = EthPrivateKey.fromHex(privateKey);
  }

  @override
  // TODO: implement accountInfo
  Future<AccountInfo> get accountInfo => Future.value(
        AccountInfo(
          (acc) => acc
            ..index = 1
            ..address = _credential.address.hexEip55
            ..pubKey = String.fromCharCodes(_credential.encodedPublicKey)
            ..priKey = privateKey,
        ),
      );

  @override
  Credentials get credentials => _credential;
}
