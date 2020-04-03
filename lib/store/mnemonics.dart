import 'package:mobx/mobx.dart';
import 'package:bip39/bip39.dart' as bip39;

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
