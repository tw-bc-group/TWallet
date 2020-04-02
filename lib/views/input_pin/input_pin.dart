import 'package:mobx/mobx.dart';
import 'package:tw_wallet_ui/common/secure_storage.dart';

part 'input_pin.g.dart';

const PIN_LENGTH = 6;

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
  setMasterKey() {
    assert(pin1.length == PIN_LENGTH);
    assert(pin1 == pin2);
    SecureStorage().setMasterKey(pin: pin1);
  }
}
