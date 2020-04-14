import 'package:bip39/bip39.dart' as bip39;
import 'package:mobx/mobx.dart';
import 'package:more/tuple.dart';
import 'package:optional/optional_internal.dart';
import 'package:tw_wallet_ui/global/common/secure_storage.dart';

part 'mnemonics.g.dart';

class MnemonicsStore = MnemonicsBase with _$MnemonicsStore;

abstract class MnemonicsBase with Store {
  MnemonicsBase(this.value);

  @computed
  bool get isSaved => value.isPresent;

  @observable
  Optional<Tuple2<int, String>> value;

  @computed
  int get index => value.map((v) => v.first).orElse(0);

  @computed
  String get mnemonics => value.map((v) => v.second).orElseGet(() {
        String mnemonics = bip39.generateMnemonic();
        value = Optional.of(Tuple2(0, mnemonics));
        return mnemonics;
      });

  static Future<MnemonicsStore> fromSecretStorage() async {
    Optional<Tuple2<int, String>> res = Optional.empty();
    String value = await SecureStorage.get(SecureStorageItem.Mnemonics);
    if (null != value) {
      var splits = value.split(' ');
      res = Optional.of(Tuple2(int.parse(splits.first), splits.last));
    }
    return MnemonicsStore(res);
  }

  @action
  Future<void> save() async {
    await SecureStorage.set(SecureStorageItem.Mnemonics, '$index $mnemonics');
  }
}
