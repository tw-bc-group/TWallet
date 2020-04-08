// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assets_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AssetsStore on _AssetsStore, Store {
  final _$currentIdentityAtom = Atom(name: '_AssetsStore.currentIdentity');

  @override
  ObservableFuture<Identity> get currentIdentity {
    _$currentIdentityAtom.context.enforceReadPolicy(_$currentIdentityAtom);
    _$currentIdentityAtom.reportObserved();
    return super.currentIdentity;
  }

  @override
  set currentIdentity(ObservableFuture<Identity> value) {
    _$currentIdentityAtom.context.conditionallyRunInAction(() {
      super.currentIdentity = value;
      _$currentIdentityAtom.reportChanged();
    }, _$currentIdentityAtom, name: '${_$currentIdentityAtom.name}_set');
  }

  final _$latestPointFutureAtom = Atom(name: '_AssetsStore.latestPointFuture');

  @override
  ObservableFuture<TwPoint> get latestPointFuture {
    _$latestPointFutureAtom.context.enforceReadPolicy(_$latestPointFutureAtom);
    _$latestPointFutureAtom.reportObserved();
    return super.latestPointFuture;
  }

  @override
  set latestPointFuture(ObservableFuture<TwPoint> value) {
    _$latestPointFutureAtom.context.conditionallyRunInAction(() {
      super.latestPointFuture = value;
      _$latestPointFutureAtom.reportChanged();
    }, _$latestPointFutureAtom, name: '${_$latestPointFutureAtom.name}_set');
  }

  final _$_AssetsStoreActionController = ActionController(name: '_AssetsStore');

  @override
  Future<dynamic> getCurrentIdentity() {
    final _$actionInfo = _$_AssetsStoreActionController.startAction();
    try {
      return super.getCurrentIdentity();
    } finally {
      _$_AssetsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> fetchLatestPoint() {
    final _$actionInfo = _$_AssetsStoreActionController.startAction();
    try {
      return super.fetchLatestPoint();
    } finally {
      _$_AssetsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'currentIdentity: ${currentIdentity.toString()},latestPointFuture: ${latestPointFuture.toString()}';
    return '{$string}';
  }
}
