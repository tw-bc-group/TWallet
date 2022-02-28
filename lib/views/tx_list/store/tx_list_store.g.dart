// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tx_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TxListStore on _TxListStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_TxListStore.loading'))
      .value;

  final _$listFutureAtom = Atom(name: '_TxListStore.listFuture');

  @override
  ObservableFuture<List<Transaction>> get listFuture {
    _$listFutureAtom.reportRead();
    return super.listFuture;
  }

  @override
  set listFuture(ObservableFuture<List<Transaction>> value) {
    _$listFutureAtom.reportWrite(value, super.listFuture, () {
      super.listFuture = value;
    });
  }

  final _$txAtom = Atom(name: '_TxListStore.tx');

  @override
  ObservableFuture<Optional<Transaction>> get tx {
    _$txAtom.reportRead();
    return super.tx;
  }

  @override
  set tx(ObservableFuture<Optional<Transaction>> value) {
    _$txAtom.reportWrite(value, super.tx, () {
      super.tx = value;
    });
  }

  final _$listAtom = Atom(name: '_TxListStore.list');

  @override
  List<Transaction> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(List<Transaction> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_TxListStore.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$fetchListAsyncAction = AsyncAction('_TxListStore.fetchList');

  @override
  Future<dynamic> fetchList(String myAddress) {
    return _$fetchListAsyncAction.run(() => super.fetchList(myAddress));
  }

  final _$_TxListStoreActionController = ActionController(name: '_TxListStore');

  @override
  Future<dynamic> fetchDetails(String hash) {
    final _$actionInfo = _$_TxListStoreActionController.startAction(
        name: '_TxListStore.fetchDetails');
    try {
      return super.fetchDetails(hash);
    } finally {
      _$_TxListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listFuture: ${listFuture},
tx: ${tx},
list: ${list},
errorMessage: ${errorMessage},
loading: ${loading}
    ''';
  }
}
