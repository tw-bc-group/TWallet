// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mnemonics.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MnemonicsStore on MnemonicsBase, Store {
  Computed<int> _$indexComputed;

  @override
  int get index => (_$indexComputed ??=
          Computed<int>(() => super.index, name: 'MnemonicsBase.index'))
      .value;
  Computed<String> _$mnemonicsComputed;

  @override
  String get mnemonics =>
      (_$mnemonicsComputed ??= Computed<String>(() => super.mnemonics,
              name: 'MnemonicsBase.mnemonics'))
          .value;

  final _$valueAtom = Atom(name: 'MnemonicsBase.value');

  @override
  Tuple2<int, String> get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(Tuple2<int, String> value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$generateKeysAsyncAction = AsyncAction('MnemonicsBase.generateKeys');

  @override
  Future<dynamic> generateKeys(GenerateKeysCallback callBack) {
    return _$generateKeysAsyncAction.run(() => super.generateKeys(callBack));
  }

  final _$saveAsyncAction = AsyncAction('MnemonicsBase.save');

  @override
  Future<void> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  final _$MnemonicsBaseActionController =
      ActionController(name: 'MnemonicsBase');

  @override
  void refresh() {
    final _$actionInfo = _$MnemonicsBaseActionController.startAction(
        name: 'MnemonicsBase.refresh');
    try {
      return super.refresh();
    } finally {
      _$MnemonicsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
index: ${index},
mnemonics: ${mnemonics}
    ''';
  }
}
