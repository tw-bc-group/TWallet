// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_code_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HealthCodeStore on HealthCodeStoreBase, Store {
  late final _$currentCountDownAtom =
      Atom(name: 'HealthCodeStoreBase.currentCountDown', context: context);

  @override
  Optional<int> get currentCountDown {
    _$currentCountDownAtom.reportRead();
    return super.currentCountDown;
  }

  @override
  set currentCountDown(Optional<int> value) {
    _$currentCountDownAtom.reportWrite(value, super.currentCountDown, () {
      super.currentCountDown = value;
    });
  }

  late final _$HealthCodeStoreBaseActionController =
      ActionController(name: 'HealthCodeStoreBase', context: context);

  @override
  void fetchLatestHealthCode() {
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
currentCountDown: ${currentCountDown}
    ''';
  }
}
