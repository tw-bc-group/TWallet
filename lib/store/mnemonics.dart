import 'package:bip39/bip39.dart' as bip39;
import 'package:mobx/mobx.dart';
import 'package:more/tuple.dart';
import 'package:tw_wallet_ui/common/secure_storage.dart';
import 'package:tw_wallet_ui/service/blockchain.dart';

part 'mnemonics.g.dart';

const saveSplitTag = '|';

class MnemonicsStore = MnemonicsBase with _$MnemonicsStore;

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
    return Tuple2(0, bip39.generateMnemonic());
  }

  static Future<MnemonicsStore> init() async {
    Tuple2<int, String> value;
    final String saved = await SecureStorage.get(SecureStorageItem.mnemonics);

    if (null != saved) {
      final List<String> splits = saved.split(saveSplitTag);
      //兼容老版本
      if (splits.length == 1) {
        value = Tuple2(0, saved);
      } else {
        value = Tuple2(int.parse(splits.first), splits.last);
      }
    } else {
      value = brandNew();
    }

    return MnemonicsStore(value);
  }

  @action
  Future<Tuple2<String, String>> generateIdentityKeys() async {
    return Future.value(BlockChainService.generateIdentityKeys(
            BlockChainService.generateHDWallet(mnemonics), ++index))
        .then((res) => save().then((_) => res));
  }

  @action
  Future<void> save() async {
    await SecureStorage.set(
        SecureStorageItem.mnemonics, '$index$saveSplitTag$mnemonics');
  }
}
