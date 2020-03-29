import 'package:mobx/mobx.dart';

part 'input_pin.g.dart';

const PinLength = 6;

class InputPin = _InputPin with _$InputPin;

abstract class _InputPin with Store {
  @observable
  String pin1 = '';

  @observable
  String pin2 = '';

  @computed
  bool get isCompleted {
    return (pin1 == pin2 &&
        pin1.length == PinLength &&
        pin2.length == PinLength);
  }

  @computed
  bool get isUnequal {
    return (pin1 != pin2 &&
        (pin1.length == PinLength && pin2.length == PinLength));
  }

  @action
  updatePin1(String value) {
    pin1 = value;
  }

  @action
  updatePin2(String value) {
    pin2 = value;
  }
}
