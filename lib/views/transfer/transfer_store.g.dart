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
    _$payerAddressAtom.context.enforceReadPolicy(_$payerAddressAtom);
    _$payerAddressAtom.reportObserved();
    return super.payerAddress;
  }

  @override
  set payerAddress(String value) {
    _$payerAddressAtom.context.conditionallyRunInAction(() {
      super.payerAddress = value;
      _$payerAddressAtom.reportChanged();
    }, _$payerAddressAtom, name: '${_$payerAddressAtom.name}_set');
  }

  final _$balanceAtom = Atom(name: '_TransferStore.balance');

  @override
  String get balance {
    _$balanceAtom.context.enforceReadPolicy(_$balanceAtom);
    _$balanceAtom.reportObserved();
    return super.balance;
  }

  @override
  set balance(String value) {
    _$balanceAtom.context.conditionallyRunInAction(() {
      super.balance = value;
      _$balanceAtom.reportChanged();
    }, _$balanceAtom, name: '${_$balanceAtom.name}_set');
  }

  final _$amountAtom = Atom(name: '_TransferStore.amount');

  @override
  String get amount {
    _$amountAtom.context.enforceReadPolicy(_$amountAtom);
    _$amountAtom.reportObserved();
    return super.amount;
  }

  @override
  set amount(String value) {
    _$amountAtom.context.conditionallyRunInAction(() {
      super.amount = value;
      _$amountAtom.reportChanged();
    }, _$amountAtom, name: '${_$amountAtom.name}_set');
  }

  final _$payeeAddressAtom = Atom(name: '_TransferStore.payeeAddress');

  @override
  String get payeeAddress {
    _$payeeAddressAtom.context.enforceReadPolicy(_$payeeAddressAtom);
    _$payeeAddressAtom.reportObserved();
    return super.payeeAddress;
  }

  @override
  set payeeAddress(String value) {
    _$payeeAddressAtom.context.conditionallyRunInAction(() {
      super.payeeAddress = value;
      _$payeeAddressAtom.reportChanged();
    }, _$payeeAddressAtom, name: '${_$payeeAddressAtom.name}_set');
  }

  final _$_TransferStoreActionController =
      ActionController(name: '_TransferStore');

  @override
  void updateBalance(String value) {
    final _$actionInfo = _$_TransferStoreActionController.startAction();
    try {
      return super.updateBalance(value);
    } finally {
      _$_TransferStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updatePayerAddress(String value) {
    final _$actionInfo = _$_TransferStoreActionController.startAction();
    try {
      return super.updatePayerAddress(value);
    } finally {
      _$_TransferStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updatePayeeAddress(String value) {
    final _$actionInfo = _$_TransferStoreActionController.startAction();
    try {
      return super.updatePayeeAddress(value);
    } finally {
      _$_TransferStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateAmount(String value) {
    final _$actionInfo = _$_TransferStoreActionController.startAction();
    try {
      return super.validateAmount(value);
    } finally {
      _$_TransferStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePayeeAddress(String value) {
    final _$actionInfo = _$_TransferStoreActionController.startAction();
    try {
      return super.validatePayeeAddress(value);
    } finally {
      _$_TransferStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'payerAddress: ${payerAddress.toString()},balance: ${balance.toString()},amount: ${amount.toString()},payeeAddress: ${payeeAddress.toString()}';
    return '{$string}';
  }
}

mixin _$FormErrorState on _FormErrorState, Store {
  Computed<bool> _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors)).value;

  final _$amountAtom = Atom(name: '_FormErrorState.amount');

  @override
  String get amount {
    _$amountAtom.context.enforceReadPolicy(_$amountAtom);
    _$amountAtom.reportObserved();
    return super.amount;
  }

  @override
  set amount(String value) {
    _$amountAtom.context.conditionallyRunInAction(() {
      super.amount = value;
      _$amountAtom.reportChanged();
    }, _$amountAtom, name: '${_$amountAtom.name}_set');
  }

  final _$payeeAddressAtom = Atom(name: '_FormErrorState.payeeAddress');

  @override
  String get payeeAddress {
    _$payeeAddressAtom.context.enforceReadPolicy(_$payeeAddressAtom);
    _$payeeAddressAtom.reportObserved();
    return super.payeeAddress;
  }

  @override
  set payeeAddress(String value) {
    _$payeeAddressAtom.context.conditionallyRunInAction(() {
      super.payeeAddress = value;
      _$payeeAddressAtom.reportChanged();
    }, _$payeeAddressAtom, name: '${_$payeeAddressAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'amount: ${amount.toString()},payeeAddress: ${payeeAddress.toString()},hasErrors: ${hasErrors.toString()}';
    return '{$string}';
  }
}
