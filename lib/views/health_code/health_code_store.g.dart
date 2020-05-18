// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_code_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HealthCodeStore on HealthCodeStoreBase, Store {
  Computed<Optional<int>> _$currentCountDownComputed;

  @override
  Optional<int> get currentCountDown => (_$currentCountDownComputed ??=
          Computed<Optional<int>>(() => super.currentCountDown,
              name: 'HealthCodeStoreBase.currentCountDown'))
      .value;

  final _$elapsedSecondsAtom = Atom(name: 'HealthCodeStoreBase.elapsedSeconds');

  @override
  int get elapsedSeconds {
    _$elapsedSecondsAtom.reportRead();
    return super.elapsedSeconds;
  }

  @override
  set elapsedSeconds(int value) {
    _$elapsedSecondsAtom.reportWrite(value, super.elapsedSeconds, () {
      super.elapsedSeconds = value;
    });
  }

  final _$HealthCodeStoreBaseActionController =
      ActionController(name: 'HealthCodeStoreBase');

  @override
  dynamic updateElapsedSeconds() {
    final _$actionInfo = _$HealthCodeStoreBaseActionController.startAction(
        name: 'HealthCodeStoreBase.updateElapsedSeconds');
    try {
      return super.updateElapsedSeconds();
    } finally {
      _$HealthCodeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchLatestHealthCode() {
    final _$actionInfo = _$HealthCodeStoreBaseActionController.startAction(
        name: 'HealthCodeStoreBase.fetchLatestHealthCode');
    try {
      return super.fetchLatestHealthCode();
    } finally {
      _$HealthCodeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
elapsedSeconds: ${elapsedSeconds},
currentCountDown: ${currentCountDown}
    ''';
  }
}
