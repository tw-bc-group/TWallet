// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mnemonics.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MnemonicsStore on MnemonicsBase, Store {
  Computed<bool> _$isSavedComputed;

  @override
  bool get isSaved =>
      (_$isSavedComputed ??= Computed<bool>(() => super.isSaved)).value;
  Computed<int> _$indexComputed;

  @override
  int get index => (_$indexComputed ??= Computed<int>(() => super.index)).value;
  Computed<String> _$mnemonicsComputed;

  @override
  String get mnemonics =>
      (_$mnemonicsComputed ??= Computed<String>(() => super.mnemonics)).value;

  final _$valueAtom = Atom(name: 'MnemonicsBase.value');

  @override
  Optional<Tuple2<int, String>> get value {
    _$valueAtom.context.enforceReadPolicy(_$valueAtom);
    _$valueAtom.reportObserved();
    return super.value;
  }

  @override
  set value(Optional<Tuple2<int, String>> value) {
    _$valueAtom.context.conditionallyRunInAction(() {
      super.value = value;
      _$valueAtom.reportChanged();
    }, _$valueAtom, name: '${_$valueAtom.name}_set');
  }

  final _$saveAsyncAction = AsyncAction('save');

  @override
  Future<void> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  @override
  String toString() {
    final string =
        'value: ${value.toString()},isSaved: ${isSaved.toString()},index: ${index.toString()},mnemonics: ${mnemonics.toString()}';
    return '{$string}';
  }
}
