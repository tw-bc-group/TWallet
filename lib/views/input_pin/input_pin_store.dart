import 'package:encrypt/encrypt.dart';
import 'package:mobx/mobx.dart';
import 'package:random_string/random_string.dart';
import 'package:tw_wallet_ui/global/common/secure_storage.dart';

part 'input_pin_store.g.dart';

const PIN_LENGTH = 6;
const MASTER_KEY_LENGTH = 32;

class InputPinStore = _InputPinStore with _$InputPinStore;

abstract class _InputPinStore with Store {
  @observable
  String pin1 = '';

  @observable
  String pin2 = '';

  @computed
  bool get isCompleted {
    return (pin1 == pin2 &&
        pin1.length == PIN_LENGTH &&
        pin2.length == PIN_LENGTH);
  }

  @computed
  bool get isUnequal {
    return (pin1 != pin2 &&
        (pin1.length == PIN_LENGTH && pin2.length == PIN_LENGTH));
  }

  @action
  updatePin1(String value) {
    pin1 = value;
  }

  @action
  updatePin2(String value) {
    pin2 = value;
  }

  @action
  Future<void> setMasterKey() async {
    final iv = IV.fromUtf8(pin1 + '0123456789');

    assert(pin1.length == PIN_LENGTH);
    assert(pin1 == pin2);
    Key aesKey = Key.fromUtf8(pin1 + 'abcdefghijklmnopqrstuvwxyz');
    var encrypt = Encrypter(AES(aesKey, mode: AESMode.cbc));
    return await SecureStorage.set(SecureStorageItem.MasterKey,
        encrypt.encrypt(randomString(MASTER_KEY_LENGTH), iv: iv).base64);
  }
}
