// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input_pin_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InputPinStore on _InputPinStore, Store {
  Computed<bool> _$isCompletedComputed;

  @override
  bool get isCompleted =>
      (_$isCompletedComputed ??= Computed<bool>(() => super.isCompleted,
              name: '_InputPinStore.isCompleted'))
          .value;
  Computed<bool> _$isUnequalComputed;

  @override
  bool get isUnequal =>
      (_$isUnequalComputed ??= Computed<bool>(() => super.isUnequal,
              name: '_InputPinStore.isUnequal'))
          .value;

  final _$pin1Atom = Atom(name: '_InputPinStore.pin1');

  @override
  String get pin1 {
    _$pin1Atom.reportRead();
    return super.pin1;
  }

  @override
  set pin1(String value) {
    _$pin1Atom.reportWrite(value, super.pin1, () {
      super.pin1 = value;
    });
  }

  final _$pin2Atom = Atom(name: '_InputPinStore.pin2');

  @override
  String get pin2 {
    _$pin2Atom.reportRead();
    return super.pin2;
  }

  @override
  set pin2(String value) {
    _$pin2Atom.reportWrite(value, super.pin2, () {
      super.pin2 = value;
    });
  }

  final _$setMasterKeyAsyncAction = AsyncAction('_InputPinStore.setMasterKey');

  @override
  Future<void> setMasterKey() {
    return _$setMasterKeyAsyncAction.run(() => super.setMasterKey());
  }

  @override
  String toString() {
    return '''
pin1: $pin1,
pin2: $pin2,
isCompleted: $isCompleted,
isUnequal: $isUnequal
    ''';
  }
}
