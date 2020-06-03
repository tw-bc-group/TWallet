// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransferStore on _TransferStore, Store {
  final _$payerDIDAtom = Atom(name: '_TransferStore.payerDID');

  @override
  String get payerDID {
    _$payerDIDAtom.reportRead();
    return super.payerDID;
  }

  @override
  set payerDID(String value) {
    _$payerDIDAtom.reportWrite(value, super.payerDID, () {
      super.payerDID = value;
    });
  }

  final _$balanceAtom = Atom(name: '_TransferStore.balance');

  @override
  String get balance {
    _$balanceAtom.reportRead();
    return super.balance;
  }

  @override
  set balance(String value) {
    _$balanceAtom.reportWrite(value, super.balance, () {
      super.balance = value;
    });
  }

  final _$amountAtom = Atom(name: '_TransferStore.amount');

  @override
  String get amount {
    _$amountAtom.reportRead();
    return super.amount;
  }

  @override
  set amount(String value) {
    _$amountAtom.reportWrite(value, super.amount, () {
      super.amount = value;
    });
  }

  final _$payeeDIDAtom = Atom(name: '_TransferStore.payeeDID');

  @override
  String get payeeDID {
    _$payeeDIDAtom.reportRead();
    return super.payeeDID;
  }

  @override
  set payeeDID(String value) {
    _$payeeDIDAtom.reportWrite(value, super.payeeDID, () {
      super.payeeDID = value;
    });
  }

  final _$_TransferStoreActionController =
      ActionController(name: '_TransferStore');

  @override
  void resetAmountError(String value) {
    final _$actionInfo = _$_TransferStoreActionController.startAction(
        name: '_TransferStore.resetAmountError');
    try {
      return super.resetAmountError(value);
    } finally {
      _$_TransferStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetAddressError(String value) {
    final _$actionInfo = _$_TransferStoreActionController.startAction(
        name: '_TransferStore.resetAddressError');
    try {
      return super.resetAddressError(value);
    } finally {
      _$_TransferStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updatePayerDID(String value) {
    final _$actionInfo = _$_TransferStoreActionController.startAction(
        name: '_TransferStore.updatePayerDID');
    try {
      return super.updatePayerDID(value);
    } finally {
      _$_TransferStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateAmount(String value) {
    final _$actionInfo = _$_TransferStoreActionController.startAction(
        name: '_TransferStore.validateAmount');
    try {
      return super.validateAmount(value);
    } finally {
      _$_TransferStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePayeeDID(String value) {
    final _$actionInfo = _$_TransferStoreActionController.startAction(
        name: '_TransferStore.validatePayeeDID');
    try {
      return super.validatePayeeDID(value);
    } finally {
      _$_TransferStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
payerDID: ${payerDID},
balance: ${balance},
amount: ${amount},
payeeDID: ${payeeDID}
    ''';
  }
}

mixin _$FormErrorState on _FormErrorState, Store {
  Computed<bool> _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_FormErrorState.hasErrors'))
          .value;

  final _$amountAtom = Atom(name: '_FormErrorState.amount');

  @override
  String get amount {
    _$amountAtom.reportRead();
    return super.amount;
  }

  @override
  set amount(String value) {
    _$amountAtom.reportWrite(value, super.amount, () {
      super.amount = value;
    });
  }

  final _$payeeDIDAtom = Atom(name: '_FormErrorState.payeeDID');

  @override
  String get payeeDID {
    _$payeeDIDAtom.reportRead();
    return super.payeeDID;
  }

  @override
  set payeeDID(String value) {
    _$payeeDIDAtom.reportWrite(value, super.payeeDID, () {
      super.payeeDID = value;
    });
  }

  @override
  String toString() {
    return '''
amount: ${amount},
payeeDID: ${payeeDID},
hasErrors: ${hasErrors}
    ''';
  }
}
