import 'package:mobx/mobx.dart';
import 'package:random_string/random_string.dart';
import 'package:steel_crypt/steel_crypt.dart';
import 'package:tw_wallet_ui/common/secure_storage.dart';

part 'input_pin_store.g.dart';

const PIN_LENGTH = 6;
const MASTER_KEY_LENGTH = 32;
const AES_ENCRYPT_MODE = 'cbc';
const AES_ENCRYPT_PADDING = 'pkcs7';
const AES_ENCRYPT_IV = '1234567890123456';

class InputPin = _InputPin with _$InputPin;

abstract class _InputPin with Store {
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
    assert(pin1.length == PIN_LENGTH);
    assert(pin1 == pin2);
    String masterKey = randomString(MASTER_KEY_LENGTH);
    var crypt = AesCrypt(masterKey, AES_ENCRYPT_MODE, AES_ENCRYPT_PADDING);
    var encrypt = crypt.encrypt(masterKey, AES_ENCRYPT_IV);
    return await SecureStorage.set(SecureStorageItem.MasterKey, encrypt);
  }
}
