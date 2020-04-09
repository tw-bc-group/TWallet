import 'package:bip39/bip39.dart' as bip39;
import 'package:mobx/mobx.dart';

part 'mnemonics.g.dart';

class MnemonicsStore = MnemonicsBase with _$MnemonicsStore;

abstract class MnemonicsBase with Store {
  @observable
  String mnemonics;

  @action
  void createMnemonics() {
    mnemonics = bip39.generateMnemonic();
  }

  @action
  void discard() {
    mnemonics = null;
  }
}
