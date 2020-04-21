// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tx_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TxListStore on _TxListStore, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading =>
      (_$loadingComputed ??= Computed<bool>(() => super.loading)).value;

  final _$listFutureAtom = Atom(name: '_TxListStore.listFuture');

  @override
  ObservableFuture<List<Transaction>> get listFuture {
    _$listFutureAtom.context.enforceReadPolicy(_$listFutureAtom);
    _$listFutureAtom.reportObserved();
    return super.listFuture;
  }

  @override
  set listFuture(ObservableFuture<List<Transaction>> value) {
    _$listFutureAtom.context.conditionallyRunInAction(() {
      super.listFuture = value;
      _$listFutureAtom.reportChanged();
    }, _$listFutureAtom, name: '${_$listFutureAtom.name}_set');
  }

  final _$txAtom = Atom(name: '_TxListStore.tx');

  @override
  ObservableFuture<Transaction> get tx {
    _$txAtom.context.enforceReadPolicy(_$txAtom);
    _$txAtom.reportObserved();
    return super.tx;
  }

  @override
  set tx(ObservableFuture<Transaction> value) {
    _$txAtom.context.conditionallyRunInAction(() {
      super.tx = value;
      _$txAtom.reportChanged();
    }, _$txAtom, name: '${_$txAtom.name}_set');
  }

  final _$listAtom = Atom(name: '_TxListStore.list');

  @override
  List<Transaction> get list {
    _$listAtom.context.enforceReadPolicy(_$listAtom);
    _$listAtom.reportObserved();
    return super.list;
  }

  @override
  set list(List<Transaction> value) {
    _$listAtom.context.conditionallyRunInAction(() {
      super.list = value;
      _$listAtom.reportChanged();
    }, _$listAtom, name: '${_$listAtom.name}_set');
  }

  final _$errorMessageAtom = Atom(name: '_TxListStore.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.context.enforceReadPolicy(_$errorMessageAtom);
    _$errorMessageAtom.reportObserved();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.context.conditionallyRunInAction(() {
      super.errorMessage = value;
      _$errorMessageAtom.reportChanged();
    }, _$errorMessageAtom, name: '${_$errorMessageAtom.name}_set');
  }

  final _$fetchListAsyncAction = AsyncAction('fetchList');

  @override
  Future<dynamic> fetchList(String myAddress) {
    return _$fetchListAsyncAction.run(() => super.fetchList(myAddress));
  }

  final _$_TxListStoreActionController = ActionController(name: '_TxListStore');

  @override
  Future<dynamic> fetchDetails(String hash) {
    final _$actionInfo = _$_TxListStoreActionController.startAction();
    try {
      return super.fetchDetails(hash);
    } finally {
      _$_TxListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'listFuture: ${listFuture.toString()},tx: ${tx.toString()},list: ${list.toString()},errorMessage: ${errorMessage.toString()},loading: ${loading.toString()}';
    return '{$string}';
  }
}
