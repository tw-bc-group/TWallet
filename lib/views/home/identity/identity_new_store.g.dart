// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_new_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IdentityNewStore on _IdentityNewStore, Store {
  late final _$nameAtom =
      Atom(name: '_IdentityNewStore.name', context: context);

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

  late final _$phoneAtom =
      Atom(name: '_IdentityNewStore.phone', context: context);

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

  late final _$emailAtom =
      Atom(name: '_IdentityNewStore.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$birthdayAtom =
      Atom(name: '_IdentityNewStore.birthday', context: context);

  @override
  String get birthday {
    _$birthdayAtom.reportRead();
    return super.birthday;
  }

  @override
  set birthday(String value) {
    _$birthdayAtom.reportWrite(value, super.birthday, () {
      super.birthday = value;
    });
  }

  late final _$addIdentityAsyncAction =
      AsyncAction('_IdentityNewStore.addIdentity', context: context);

  @override
  Future<dynamic> addIdentity() {
    return _$addIdentityAsyncAction.run(() => super.addIdentity());
  }

  late final _$_IdentityNewStoreActionController =
      ActionController(name: '_IdentityNewStore', context: context);

  @override
  void clearError() {
    final _$actionInfo = _$_IdentityNewStoreActionController.startAction(
        name: '_IdentityNewStore.clearError');
    try {
      return super.clearError();
    } finally {
      _$_IdentityNewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetNameError(String value) {
    final _$actionInfo = _$_IdentityNewStoreActionController.startAction(
        name: '_IdentityNewStore.resetNameError');
    try {
      return super.resetNameError(value);
    } finally {
      _$_IdentityNewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetPhoneError(String value) {
    final _$actionInfo = _$_IdentityNewStoreActionController.startAction(
        name: '_IdentityNewStore.resetPhoneError');
    try {
      return super.resetPhoneError(value);
    } finally {
      _$_IdentityNewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetEmailError(String value) {
    final _$actionInfo = _$_IdentityNewStoreActionController.startAction(
        name: '_IdentityNewStore.resetEmailError');
    try {
      return super.resetEmailError(value);
    } finally {
      _$_IdentityNewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetBirthdayError(String value) {
    final _$actionInfo = _$_IdentityNewStoreActionController.startAction(
        name: '_IdentityNewStore.resetBirthdayError');
    try {
      return super.resetBirthdayError(value);
    } finally {
      _$_IdentityNewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
phone: ${phone},
email: ${email},
birthday: ${birthday}
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

  late final _$usernameAtom =
      Atom(name: '_FormErrorState.username', context: context);

  @override
  String? get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String? value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  late final _$phoneAtom =
      Atom(name: '_FormErrorState.phone', context: context);

  @override
  String? get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String? value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_FormErrorState.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$birthdayAtom =
      Atom(name: '_FormErrorState.birthday', context: context);

  @override
  String? get birthday {
    _$birthdayAtom.reportRead();
    return super.birthday;
  }

  @override
  set birthday(String? value) {
    _$birthdayAtom.reportWrite(value, super.birthday, () {
      super.birthday = value;
    });
  }

  @override
  String toString() {
    return '''
username: ${username},
phone: ${phone},
email: ${email},
birthday: ${birthday},
hasErrors: ${hasErrors}
    ''';
  }
}
