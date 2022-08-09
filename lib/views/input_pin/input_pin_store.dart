import 'package:encrypt/encrypt.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:random_string/random_string.dart';
import 'package:tw_wallet_ui/common/secure_storage.dart';

part 'input_pin_store.g.dart';

const pinLength = 6;
const masterKeyLength = 32;

class InputPinStore = _InputPinStore with _$InputPinStore;

abstract class _InputPinStore with Store {
  @observable
  String pin1 = '';

  @observable
  String pin2 = '';

  @computed
  bool get isCompleted {
    return pin1 == pin2 && pin1.length == pinLength && pin2.length == pinLength;
  }

  @computed
  bool get isUnequal {
    return pin1 != pin2 &&
        (pin1.length == pinLength && pin2.length == pinLength);
  }

  @action
  Future<void> setMasterKey() async {
    final iv = IV.fromUtf8('${pin1}0123456789');
    assert(pin1.length == pinLength);
    assert(pin1 == pin2);

    final Key aesKey = Key.fromUtf8('${pin1}abcdefghijklmnopqrstuvwxyz');
    final encrypt = Encrypter(AES(aesKey, mode: AESMode.cbc));

    return Get.find<SecureStorage>().set(
      SecureStorageItem.masterKey,
      encrypt.encrypt(randomString(masterKeyLength), iv: iv).base64,
    );
  }
}
