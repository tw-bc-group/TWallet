import 'package:magic_sdk/magic_sdk.dart';

Magic magicLink() {
  return Magic.custom(
    "pk_live_CCD4C7EF13C55895",
    rpcUrl: 'https://rinkeby.infura.io/v3/f392fa8f8e5448b690169441ea7d43e6',
    chainId: 0x4,
  );
}
