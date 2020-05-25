// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_new_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$IdentityNewStore on _IdentityNewStore, Store {
  final _$nameAtom = Atom(name: '_IdentityNewStore.name');

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

  final _$phoneAtom = Atom(name: '_IdentityNewStore.phone');

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

  final _$emailAtom = Atom(name: '_IdentityNewStore.email');

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

  final _$birthdayAtom = Atom(name: '_IdentityNewStore.birthday');

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

  final _$addIdentityAsyncAction = AsyncAction('_IdentityNewStore.addIdentity');

  @override
  Future<bool> addIdentity() {
    return _$addIdentityAsyncAction.run(() => super.addIdentity());
  }

  final _$_IdentityNewStoreActionController =
      ActionController(name: '_IdentityNewStore');

  @override
  void validateUsername(String value) {
    final _$actionInfo = _$_IdentityNewStoreActionController.startAction(
        name: '_IdentityNewStore.validateUsername');
    try {
      return super.validateUsername(value);
    } finally {
      _$_IdentityNewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePhone(String value) {
    final _$actionInfo = _$_IdentityNewStoreActionController.startAction(
        name: '_IdentityNewStore.validatePhone');
    try {
      return super.validatePhone(value);
    } finally {
      _$_IdentityNewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail(String value) {
    final _$actionInfo = _$_IdentityNewStoreActionController.startAction(
        name: '_IdentityNewStore.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$_IdentityNewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateBirthday(String value) {
    final _$actionInfo = _$_IdentityNewStoreActionController.startAction(
        name: '_IdentityNewStore.validateBirthday');
    try {
      return super.validateBirthday(value);
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
  Computed<bool> _$hasErrorsComputed;

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

  final _$emailAtom = Atom(name: '_FormErrorState.email');

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

  final _$birthdayAtom = Atom(name: '_FormErrorState.birthday');

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
