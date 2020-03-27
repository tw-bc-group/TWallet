import 'package:mobx/mobx.dart';

part 'input_pin.g.dart';

const PinLength = 6;

class InputPin = _InputPin with _$InputPin;

enum InputPinStatus {
  InCompleted,
  Unequal,
  Completed,
}

extension InputPinStatusExtension on InputPinStatus {
  bool isCompleted() {
    return this == InputPinStatus.Completed;
  }

  bool isUnequal() {
    return this == InputPinStatus.Unequal;
  }
}

abstract class _InputPin with Store {
  String pin1 = '';
  String pin2 = '';

  @computed
  InputPinStatus get status {
    InputPinStatus status;

    if (pin1.length == PinLength && pin2.length == PinLength) {
      if (pin1 != pin2) {
        status = InputPinStatus.Unequal;
      } else {
        status = InputPinStatus.Completed;
      }
    } else {
      status = InputPinStatus.InCompleted;
    }
    return status;
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
