// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mnemonics.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MnemonicsStore on MnemonicsBase, Store {
  final _$mnemonicsAtom = Atom(name: 'MnemonicsBase.mnemonics');

  @override
  String get mnemonics {
    _$mnemonicsAtom.context.enforceReadPolicy(_$mnemonicsAtom);
    _$mnemonicsAtom.reportObserved();
    return super.mnemonics;
  }

  @override
  set mnemonics(String value) {
    _$mnemonicsAtom.context.conditionallyRunInAction(() {
      super.mnemonics = value;
      _$mnemonicsAtom.reportChanged();
    }, _$mnemonicsAtom, name: '${_$mnemonicsAtom.name}_set');
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
    final string = 'mnemonics: ${mnemonics.toString()}';
    return '{$string}';
  }
}
