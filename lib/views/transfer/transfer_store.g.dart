// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransferStore on _TransferStore, Store {
  final _$payerAddressAtom = Atom(name: '_TransferStore.payerAddress');

  @override
  String get payerAddress {
    _$payerAddressAtom.reportRead();
    return super.payerAddress;
  }

  @override
  set payerAddress(String value) {
    _$payerAddressAtom.reportWrite(value, super.payerAddress, () {
      super.payerAddress = value;
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

  final _$payeeAddressAtom = Atom(name: '_TransferStore.payeeAddress');

  @override
  String get payeeAddress {
    _$payeeAddressAtom.reportRead();
    return super.payeeAddress;
  }

  @override
  set payeeAddress(String value) {
    _$payeeAddressAtom.reportWrite(value, super.payeeAddress, () {
      super.payeeAddress = value;
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
  void updatePayerAddress(String value) {
    final _$actionInfo = _$_TransferStoreActionController.startAction(
        name: '_TransferStore.updatePayerAddress');
    try {
      return super.updatePayerAddress(value);
    } finally {
      _$_TransferStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updatePayeeAddress(String value) {
    final _$actionInfo = _$_TransferStoreActionController.startAction(
        name: '_TransferStore.updatePayeeAddress');
    try {
      return super.updatePayeeAddress(value);
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
  void validatePayeeAddress(String value) {
    final _$actionInfo = _$_TransferStoreActionController.startAction(
        name: '_TransferStore.validatePayeeAddress');
    try {
      return super.validatePayeeAddress(value);
    } finally {
      _$_TransferStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
payerAddress: ${payerAddress},
balance: ${balance},
amount: ${amount},
payeeAddress: ${payeeAddress}
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

  final _$payeeAddressAtom = Atom(name: '_FormErrorState.payeeAddress');

  @override
  String get payeeAddress {
    _$payeeAddressAtom.reportRead();
    return super.payeeAddress;
  }

  @override
  set payeeAddress(String value) {
    _$payeeAddressAtom.reportWrite(value, super.payeeAddress, () {
      super.payeeAddress = value;
    });
  }

  @override
  String toString() {
    return '''
amount: ${amount},
payeeAddress: ${payeeAddress},
hasErrors: ${hasErrors}
    ''';
  }
}
