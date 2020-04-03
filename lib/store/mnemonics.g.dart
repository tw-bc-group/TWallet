// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mnemonics.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Mnemonics on MnemonicsBase, Store {
  final _$mnemoncisAtom = Atom(name: 'MnemonicsBase.mnemoncis');

  @override
  String get mnemonics {
    _$mnemoncisAtom.context.enforceReadPolicy(_$mnemoncisAtom);
    _$mnemoncisAtom.reportObserved();
    return super.mnemonics;
  }

  @override
  set mnemonics(String value) {
    _$mnemoncisAtom.context.conditionallyRunInAction(() {
      super.mnemonics = value;
      _$mnemoncisAtom.reportChanged();
    }, _$mnemoncisAtom, name: '${_$mnemoncisAtom.name}_set');
  }

  final _$MnemonicsBaseActionController =
      ActionController(name: 'MnemonicsBase');

  @override
  void createMnemonics() {
    final _$actionInfo = _$MnemonicsBaseActionController.startAction();
    try {
      return super.createMnemonics();
    } finally {
      _$MnemonicsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void discard() {
    final _$actionInfo = _$MnemonicsBaseActionController.startAction();
    try {
      return super.discard();
    } finally {
      _$MnemonicsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'mnemoncis: ${mnemonics.toString()}';
    return '{$string}';
  }
}
