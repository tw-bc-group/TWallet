// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  final _$latestPointFutureAtom = Atom(name: '_HomeStore.latestPointFuture');

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

  final _$_HomeStoreActionController = ActionController(name: '_HomeStore');

  @override
  Future<dynamic> fetchLatestPoint() {
    final _$actionInfo = _$_HomeStoreActionController.startAction();
    try {
      return super.fetchLatestPoint();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'latestPointFuture: ${latestPointFuture.toString()}';
    return '{$string}';
  }
}
