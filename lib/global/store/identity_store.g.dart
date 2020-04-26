// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$IdentityStore on IdentityStoreBase, Store {
  Computed<Optional<Identity>> _$selectedIdentityComputed;

  @override
  Optional<Identity> get selectedIdentity => (_$selectedIdentityComputed ??=
          Computed<Optional<Identity>>(() => super.selectedIdentity))
      .value;
  Computed<String> _$myNameComputed;

  @override
  String get myName =>
      (_$myNameComputed ??= Computed<String>(() => super.myName)).value;
  Computed<String> _$myAddressComputed;

  @override
  String get myAddress =>
      (_$myAddressComputed ??= Computed<String>(() => super.myAddress)).value;
  Computed<Amount> _$myBalanceComputed;

  @override
  Amount get myBalance =>
      (_$myBalanceComputed ??= Computed<Amount>(() => super.myBalance)).value;

  final _$selectedIndexAtom = Atom(name: 'IdentityStoreBase.selectedIndex');

  @override
  int get selectedIndex {
    _$selectedIndexAtom.context.enforceReadPolicy(_$selectedIndexAtom);
    _$selectedIndexAtom.reportObserved();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.context.conditionallyRunInAction(() {
      super.selectedIndex = value;
      _$selectedIndexAtom.reportChanged();
    }, _$selectedIndexAtom, name: '${_$selectedIndexAtom.name}_set');
  }

  final _$identitiesAtom = Atom(name: 'IdentityStoreBase.identities');

  @override
  List<Identity> get identities {
    _$identitiesAtom.context.enforceReadPolicy(_$identitiesAtom);
    _$identitiesAtom.reportObserved();
    return super.identities;
  }

  @override
  set identities(List<Identity> value) {
    _$identitiesAtom.context.conditionallyRunInAction(() {
      super.identities = value;
      _$identitiesAtom.reportChanged();
    }, _$identitiesAtom, name: '${_$identitiesAtom.name}_set');
  }

  final _$searchNameAtom = Atom(name: 'IdentityStoreBase.searchName');

  @override
  String get searchName {
    _$searchNameAtom.context.enforceReadPolicy(_$searchNameAtom);
    _$searchNameAtom.reportObserved();
    return super.searchName;
  }

  @override
  set searchName(String value) {
    _$searchNameAtom.context.conditionallyRunInAction(() {
      super.searchName = value;
      _$searchNameAtom.reportChanged();
    }, _$searchNameAtom, name: '${_$searchNameAtom.name}_set');
  }

  final _$clearAsyncAction = AsyncAction('clear');

  @override
  Future<void> clear() {
    return _$clearAsyncAction.run(() => super.clear());
  }

  final _$selectIdentityAsyncAction = AsyncAction('selectIdentity');

  @override
  Future<void> selectIdentity({@required int index}) {
    return _$selectIdentityAsyncAction
        .run(() => super.selectIdentity(index: index));
  }

  final _$addIdentityAsyncAction = AsyncAction('addIdentity');

  @override
  Future<void> addIdentity({@required Identity identity}) {
    return _$addIdentityAsyncAction
        .run(() => super.addIdentity(identity: identity));
  }

  final _$deleteIdentityAsyncAction = AsyncAction('deleteIdentity');

  @override
  Future<void> deleteIdentity({@required int index}) {
    return _$deleteIdentityAsyncAction
        .run(() => super.deleteIdentity(index: index));
  }

  final _$IdentityStoreBaseActionController =
      ActionController(name: 'IdentityStoreBase');

  @override
  void updateSearchName(String name) {
    final _$actionInfo = _$IdentityStoreBaseActionController.startAction();
    try {
      return super.updateSearchName(name);
    } finally {
      _$IdentityStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateSelectedIdentity(Identity identity) {
    final _$actionInfo = _$IdentityStoreBaseActionController.startAction();
    try {
      return super.updateSelectedIdentity(identity);
    } finally {
      _$IdentityStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchLatestPoint() {
    final _$actionInfo = _$IdentityStoreBaseActionController.startAction();
    try {
      return super.fetchLatestPoint();
    } finally {
      _$IdentityStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'selectedIndex: ${selectedIndex.toString()},identities: ${identities.toString()},searchName: ${searchName.toString()},selectedIdentity: ${selectedIdentity.toString()},myName: ${myName.toString()},myAddress: ${myAddress.toString()},myBalance: ${myBalance.toString()}';
    return '{$string}';
  }
}
