// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EnvStore on _EnvStore, Store {
  final _$envAtom = Atom(name: '_EnvStore.env');

  @override
  Env get env {
    _$envAtom.context.enforceReadPolicy(_$envAtom);
    _$envAtom.reportObserved();
    return super.env;
  }

  @override
  set env(Env value) {
    _$envAtom.context.conditionallyRunInAction(() {
      super.env = value;
      _$envAtom.reportChanged();
    }, _$envAtom, name: '${_$envAtom.name}_set');
  }

  final _$_EnvStoreActionController = ActionController(name: '_EnvStore');

  @override
  void updateEnv(Env newEnv) {
    final _$actionInfo = _$_EnvStoreActionController.startAction();
    try {
      return super.updateEnv(newEnv);
    } finally {
      _$_EnvStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'env: ${env.toString()}';
    return '{$string}';
  }
}
