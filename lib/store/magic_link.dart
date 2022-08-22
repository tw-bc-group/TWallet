import 'package:get/get.dart';
import 'package:magic_sdk/magic_sdk.dart';
import 'package:tw_wallet_ui/models/identity/account_info.dart';
import 'package:tw_wallet_ui/store/account_store.dart';
import 'package:web3dart/web3dart.dart';

Magic magicLink() {
  return Magic.custom(
    "pk_live_CCD4C7EF13C55895",
    rpcUrl: 'https://rinkeby.infura.io/v3/f392fa8f8e5448b690169441ea7d43e6',
    chainId: 0x4,
  );
}

class MagicLinkStore implements AccountStore {
  late final MagicCredential creds;
  MagicLinkStore(this.creds);
  static Future<MagicLinkStore> init() async {
    final instance = Get.find<Magic>();
    final credentials = MagicCredential(instance.provider);
    return MagicLinkStore(credentials);
  }

  @override
  // TODO: implement accountInfo
  Future<AccountInfo> get accountInfo => creds.getAccount().then(
        (etherAccount) => AccountInfo(
          (acc) => acc
            ..index = 1
            ..address = etherAccount.hex
            ..pubKey = ''
            ..priKey = '',
        ),
      );

  @override
  // TODO: implement credentials
  Credentials get credentials => creds;
}
