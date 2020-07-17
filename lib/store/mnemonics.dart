import 'package:bip39/bip39.dart' as bip39;
import 'package:mobx/mobx.dart';
import 'package:more/tuple.dart';
import 'package:tw_wallet_ui/common/secure_storage.dart';
import 'package:tw_wallet_ui/service/blockchain.dart';

part 'mnemonics.g.dart';

typedef GenerateKeysCallback = Future<dynamic> Function(
    Tuple2<String, String> keys);

const saveSplitTag = '|';
const identityStartIndex = 1;

class MnemonicsStore extends MnemonicsBase with _$MnemonicsStore {
  MnemonicsStore(Tuple2<int, String> value) : super(value);

  static Future<MnemonicsStore> init() async {
    Tuple2<int, String> value;
    final String saved = await SecureStorage.get(SecureStorageItem.mnemonics);

    if (null != saved) {
      final List<String> splits = saved.split(saveSplitTag);
      //兼容老版本
      if (splits.length == 1) {
        value = Tuple2(identityStartIndex, saved);
      } else {
        value = Tuple2(int.parse(splits.first), splits.last);
      }
    } else {
      value = MnemonicsBase.brandNew();
    }

    return MnemonicsStore(value);
  }
}

abstract class MnemonicsBase with Store {
  MnemonicsBase(this.value);

  @observable
  Tuple2<int, String> value;

  @computed
  int get index => value.first;

  set index(int newIndex) => value = value.withFirst(newIndex);

  @computed
  String get mnemonics => value.second;

  @action
  void refresh() {
    value = brandNew();
  }

  static Tuple2<int, String> brandNew() {
    //the index 0 is used to call save identities contract
    return Tuple2(identityStartIndex, bip39.generateMnemonic());
  }

  @action
  Future<dynamic> generateKeys(GenerateKeysCallback callBack) async {
    return Future.value(BlockChainService.generateKeys(
            BlockChainService.generateHDWallet(mnemonics), ++index))
        .then((keys) => callBack(keys))
        .then((res) {
      return save().then((_) => res);
    });
  }

  @action
  Future<void> save() async {
    await SecureStorage.set(
        SecureStorageItem.mnemonics, '$index$saveSplitTag$mnemonics');
  }
}
