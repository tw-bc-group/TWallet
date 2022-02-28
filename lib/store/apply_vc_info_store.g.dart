// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apply_vc_info_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ApplyVcInfoStore on _ApplyVcInfoStore, Store {
  final _$nameAtom = Atom(name: '_ApplyVcInfoStore.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$phoneAtom = Atom(name: '_ApplyVcInfoStore.phone');

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$applyNewVcAsyncAction = AsyncAction('_ApplyVcInfoStore.applyNewVc');

  @override
  Future<dynamic> applyNewVc() {
    return _$applyNewVcAsyncAction.run(() => super.applyNewVc());
  }

  final _$_ApplyVcInfoStoreActionController =
      ActionController(name: '_ApplyVcInfoStore');

  @override
  void clearError() {
    final _$actionInfo = _$_ApplyVcInfoStoreActionController.startAction(
        name: '_ApplyVcInfoStore.clearError');
    try {
      return super.clearError();
    } finally {
      _$_ApplyVcInfoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetNameError(String value) {
    final _$actionInfo = _$_ApplyVcInfoStoreActionController.startAction(
        name: '_ApplyVcInfoStore.resetNameError');
    try {
      return super.resetNameError(value);
    } finally {
      _$_ApplyVcInfoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetPhoneError(String value) {
    final _$actionInfo = _$_ApplyVcInfoStoreActionController.startAction(
        name: '_ApplyVcInfoStore.resetPhoneError');
    try {
      return super.resetPhoneError(value);
    } finally {
      _$_ApplyVcInfoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
phone: ${phone}
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

  final _$usernameAtom = Atom(name: '_FormErrorState.username');

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  final _$phoneAtom = Atom(name: '_FormErrorState.phone');

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  @override
  String toString() {
    return '''
username: ${username},
phone: ${phone},
hasErrors: ${hasErrors}
    ''';
  }
}
