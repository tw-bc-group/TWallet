// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input_pin.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InputPin on _InputPin, Store {
  Computed<bool> _$isCompletedComputed;

  @override
  bool get isCompleted =>
      (_$isCompletedComputed ??= Computed<bool>(() => super.isCompleted)).value;
  Computed<bool> _$isUnequalComputed;

  @override
  bool get isUnequal =>
      (_$isUnequalComputed ??= Computed<bool>(() => super.isUnequal)).value;

  final _$pin1Atom = Atom(name: '_InputPin.pin1');

  @override
  String get pin1 {
    _$pin1Atom.context.enforceReadPolicy(_$pin1Atom);
    _$pin1Atom.reportObserved();
    return super.pin1;
  }

  @override
  set pin1(String value) {
    _$pin1Atom.context.conditionallyRunInAction(() {
      super.pin1 = value;
      _$pin1Atom.reportChanged();
    }, _$pin1Atom, name: '${_$pin1Atom.name}_set');
  }

  final _$pin2Atom = Atom(name: '_InputPin.pin2');

  @override
  String get pin2 {
    _$pin2Atom.context.enforceReadPolicy(_$pin2Atom);
    _$pin2Atom.reportObserved();
    return super.pin2;
  }

  @override
  set pin2(String value) {
    _$pin2Atom.context.conditionallyRunInAction(() {
      super.pin2 = value;
      _$pin2Atom.reportChanged();
    }, _$pin2Atom, name: '${_$pin2Atom.name}_set');
  }

  final _$setMasterKeyAsyncAction = AsyncAction('setMasterKey');

  @override
  Future<void> setMasterKey() {
    return _$setMasterKeyAsyncAction.run(() => super.setMasterKey());
  }

  final _$_InputPinActionController = ActionController(name: '_InputPin');

  @override
  dynamic updatePin1(String value) {
    final _$actionInfo = _$_InputPinActionController.startAction();
    try {
      return super.updatePin1(value);
    } finally {
      _$_InputPinActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updatePin2(String value) {
    final _$actionInfo = _$_InputPinActionController.startAction();
    try {
      return super.updatePin2(value);
    } finally {
      _$_InputPinActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'pin1: ${pin1.toString()},pin2: ${pin2.toString()},isCompleted: ${isCompleted.toString()},isUnequal: ${isUnequal.toString()}';
    return '{$string}';
  }
}
