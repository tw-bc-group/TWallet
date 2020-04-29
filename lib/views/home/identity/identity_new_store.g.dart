// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_new_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$IdentityNewStore on _IdentityNewStore, Store {
  final _$avatarAtom = Atom(name: '_IdentityNewStore.avatar');

  @override
  Avataaar get avatar {
    _$avatarAtom.context.enforceReadPolicy(_$avatarAtom);
    _$avatarAtom.reportObserved();
    return super.avatar;
  }

  @override
  set avatar(Avataaar value) {
    _$avatarAtom.context.conditionallyRunInAction(() {
      super.avatar = value;
      _$avatarAtom.reportChanged();
    }, _$avatarAtom, name: '${_$avatarAtom.name}_set');
  }

  final _$nameAtom = Atom(name: '_IdentityNewStore.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$phoneAtom = Atom(name: '_IdentityNewStore.phone');

  @override
  String get phone {
    _$phoneAtom.context.enforceReadPolicy(_$phoneAtom);
    _$phoneAtom.reportObserved();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.context.conditionallyRunInAction(() {
      super.phone = value;
      _$phoneAtom.reportChanged();
    }, _$phoneAtom, name: '${_$phoneAtom.name}_set');
  }

  final _$emailAtom = Atom(name: '_IdentityNewStore.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$birthdayAtom = Atom(name: '_IdentityNewStore.birthday');

  @override
  String get birthday {
    _$birthdayAtom.context.enforceReadPolicy(_$birthdayAtom);
    _$birthdayAtom.reportObserved();
    return super.birthday;
  }

  @override
  set birthday(String value) {
    _$birthdayAtom.context.conditionallyRunInAction(() {
      super.birthday = value;
      _$birthdayAtom.reportChanged();
    }, _$birthdayAtom, name: '${_$birthdayAtom.name}_set');
  }

  final _$addIdentityAsyncAction = AsyncAction('addIdentity');

  @override
  Future<bool> addIdentity() {
    return _$addIdentityAsyncAction.run(() => super.addIdentity());
  }

  final _$_IdentityNewStoreActionController =
      ActionController(name: '_IdentityNewStore');

  @override
  void refreshAvatar() {
    final _$actionInfo = _$_IdentityNewStoreActionController.startAction();
    try {
      return super.refreshAvatar();
    } finally {
      _$_IdentityNewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateUsername(String value) {
    final _$actionInfo = _$_IdentityNewStoreActionController.startAction();
    try {
      return super.validateUsername(value);
    } finally {
      _$_IdentityNewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePhone(String value) {
    final _$actionInfo = _$_IdentityNewStoreActionController.startAction();
    try {
      return super.validatePhone(value);
    } finally {
      _$_IdentityNewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail(String value) {
    final _$actionInfo = _$_IdentityNewStoreActionController.startAction();
    try {
      return super.validateEmail(value);
    } finally {
      _$_IdentityNewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateBirthday(String value) {
    final _$actionInfo = _$_IdentityNewStoreActionController.startAction();
    try {
      return super.validateBirthday(value);
    } finally {
      _$_IdentityNewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'avatar: ${avatar.toString()},name: ${name.toString()},phone: ${phone.toString()},email: ${email.toString()},birthday: ${birthday.toString()}';
    return '{$string}';
  }
}

mixin _$FormErrorState on _FormErrorState, Store {
  Computed<bool> _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors)).value;

  final _$usernameAtom = Atom(name: '_FormErrorState.username');

  @override
  String get username {
    _$usernameAtom.context.enforceReadPolicy(_$usernameAtom);
    _$usernameAtom.reportObserved();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.context.conditionallyRunInAction(() {
      super.username = value;
      _$usernameAtom.reportChanged();
    }, _$usernameAtom, name: '${_$usernameAtom.name}_set');
  }

  final _$phoneAtom = Atom(name: '_FormErrorState.phone');

  @override
  String get phone {
    _$phoneAtom.context.enforceReadPolicy(_$phoneAtom);
    _$phoneAtom.reportObserved();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.context.conditionallyRunInAction(() {
      super.phone = value;
      _$phoneAtom.reportChanged();
    }, _$phoneAtom, name: '${_$phoneAtom.name}_set');
  }

  final _$emailAtom = Atom(name: '_FormErrorState.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$birthdayAtom = Atom(name: '_FormErrorState.birthday');

  @override
  String get birthday {
    _$birthdayAtom.context.enforceReadPolicy(_$birthdayAtom);
    _$birthdayAtom.reportObserved();
    return super.birthday;
  }

  @override
  set birthday(String value) {
    _$birthdayAtom.context.conditionallyRunInAction(() {
      super.birthday = value;
      _$birthdayAtom.reportChanged();
    }, _$birthdayAtom, name: '${_$birthdayAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'username: ${username.toString()},phone: ${phone.toString()},email: ${email.toString()},birthday: ${birthday.toString()},hasErrors: ${hasErrors.toString()}';
    return '{$string}';
  }
}
