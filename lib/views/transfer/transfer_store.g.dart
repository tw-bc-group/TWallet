// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TransferStore on _TransferStore, Store {
  late final _$payerDIDAtom =
      Atom(name: '_TransferStore.payerDID', context: context);

  @override
  String? get payerDID {
    _$payerDIDAtom.reportRead();
    return super.payerDID;
  }

  @override
  set payerDID(String? value) {
    _$payerDIDAtom.reportWrite(value, super.payerDID, () {
      super.payerDID = value;
    });
  }

  late final _$balanceAtom =
      Atom(name: '_TransferStore.balance', context: context);

  @override
  String? get balance {
    _$balanceAtom.reportRead();
    return super.balance;
  }

  @override
  set balance(String? value) {
    _$balanceAtom.reportWrite(value, super.balance, () {
      super.balance = value;
    });
  }

  late final _$amountAtom =
      Atom(name: '_TransferStore.amount', context: context);

  @override
  String? get amount {
    _$amountAtom.reportRead();
    return super.amount;
  }

  @override
  set amount(String? value) {
    _$amountAtom.reportWrite(value, super.amount, () {
      super.amount = value;
    });
  }

  late final _$payeeDIDAtom =
      Atom(name: '_TransferStore.payeeDID', context: context);

  @override
  String? get payeeDID {
    _$payeeDIDAtom.reportRead();
    return super.payeeDID;
  }

  @override
  set payeeDID(String? value) {
    _$payeeDIDAtom.reportWrite(value, super.payeeDID, () {
      super.payeeDID = value;
    });
  }

  late final _$_TransferStoreActionController =
      ActionController(name: '_TransferStore', context: context);

  @override
  void resetAmountError(String? value) {
    final _$actionInfo = _$_TransferStoreActionController.startAction(
        name: '_TransferStore.resetAmountError');
    try {
      return super.resetAmountError(value);
    } finally {
      _$_TransferStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetAddressError(String? value) {
    final _$actionInfo = _$_TransferStoreActionController.startAction(
        name: '_TransferStore.resetAddressError');
    try {
      return super.resetAddressError(value);
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
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_FormErrorState.hasErrors'))
          .value;

  late final _$amountAtom =
      Atom(name: '_FormErrorState.amount', context: context);

  @override
  String? get amount {
    _$amountAtom.reportRead();
    return super.amount;
  }

  @override
  set amount(String? value) {
    _$amountAtom.reportWrite(value, super.amount, () {
      super.amount = value;
    });
  }

  late final _$payeeDIDAtom =
      Atom(name: '_FormErrorState.payeeDID', context: context);

  @override
  String? get payeeDID {
    _$payeeDIDAtom.reportRead();
    return super.payeeDID;
  }

  @override
  set payeeDID(String? value) {
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
