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
          Computed<Optional<Identity>>(() => super.selectedIdentity,
              name: 'IdentityStoreBase.selectedIdentity'))
      .value;
  Computed<String> _$myNameComputed;

  @override
  String get myName =>
      (_$myNameComputed ??= Computed<String>(() => super.myName,
              name: 'IdentityStoreBase.myName'))
          .value;
  Computed<String> _$myAddressComputed;

  @override
  String get myAddress =>
      (_$myAddressComputed ??= Computed<String>(() => super.myAddress,
              name: 'IdentityStoreBase.myAddress'))
          .value;
  Computed<Amount> _$myBalanceComputed;

  @override
  Amount get myBalance =>
      (_$myBalanceComputed ??= Computed<Amount>(() => super.myBalance,
              name: 'IdentityStoreBase.myBalance'))
          .value;
  Computed<List<Identity>> _$selectedFirstIdentitiesComputed;

  @override
  List<Identity> get selectedFirstIdentities =>
      (_$selectedFirstIdentitiesComputed ??= Computed<List<Identity>>(
              () => super.selectedFirstIdentities,
              name: 'IdentityStoreBase.selectedFirstIdentities'))
          .value;
  Computed<List<Identity>> _$selectedFirstIdentitiesInHealthDAppComputed;

  @override
  List<Identity> get selectedFirstIdentitiesInHealthDApp =>
      (_$selectedFirstIdentitiesInHealthDAppComputed ??=
              Computed<List<Identity>>(
                  () => super.selectedFirstIdentitiesInHealthDApp,
                  name:
                      'IdentityStoreBase.selectedFirstIdentitiesInHealthDApp'))
          .value;

  final _$healthCertLastSelectIndexAtom =
      Atom(name: 'IdentityStoreBase.healthCertLastSelectIndex');

  @override
  int get healthCertLastSelectIndex {
    _$healthCertLastSelectIndexAtom.reportRead();
    return super.healthCertLastSelectIndex;
  }

  @override
  set healthCertLastSelectIndex(int value) {
    _$healthCertLastSelectIndexAtom
        .reportWrite(value, super.healthCertLastSelectIndex, () {
      super.healthCertLastSelectIndex = value;
    });
  }

  final _$identitiesAtom = Atom(name: 'IdentityStoreBase.identities');

  @override
  ObservableList<Identity> get identities {
    _$identitiesAtom.reportRead();
    return super.identities;
  }

  @override
  set identities(ObservableList<Identity> value) {
    _$identitiesAtom.reportWrite(value, super.identities, () {
      super.identities = value;
    });
  }

  final _$searchNameAtom = Atom(name: 'IdentityStoreBase.searchName');

  @override
  String get searchName {
    _$searchNameAtom.reportRead();
    return super.searchName;
  }

  @override
  set searchName(String value) {
    _$searchNameAtom.reportWrite(value, super.searchName, () {
      super.searchName = value;
    });
  }

  final _$clearAsyncAction = AsyncAction('IdentityStoreBase.clear');

  @override
  Future<void> clear() {
    return _$clearAsyncAction.run(() => super.clear());
  }

  final _$selectIdentityAsyncAction =
      AsyncAction('IdentityStoreBase.selectIdentity');

  @override
  Future<void> selectIdentity({@required int index}) {
    return _$selectIdentityAsyncAction
        .run(() => super.selectIdentity(index: index));
  }

  final _$addIdentityAsyncAction = AsyncAction('IdentityStoreBase.addIdentity');

  @override
  Future<void> addIdentity({@required Identity identity}) {
    return _$addIdentityAsyncAction
        .run(() => super.addIdentity(identity: identity));
  }

  final _$updateIdentityAsyncAction =
      AsyncAction('IdentityStoreBase.updateIdentity');

  @override
  Future<void> updateIdentity(Identity identity) {
    return _$updateIdentityAsyncAction
        .run(() => super.updateIdentity(identity));
  }

  final _$updateHealthCertLastSelectedAsyncAction =
      AsyncAction('IdentityStoreBase.updateHealthCertLastSelected');

  @override
  Future<dynamic> updateHealthCertLastSelected(Identity identity) {
    return _$updateHealthCertLastSelectedAsyncAction
        .run(() => super.updateHealthCertLastSelected(identity));
  }

  final _$IdentityStoreBaseActionController =
      ActionController(name: 'IdentityStoreBase');

  @override
  void setIdentityIsSelected(int index, {bool isSelected}) {
    final _$actionInfo = _$IdentityStoreBaseActionController.startAction(
        name: 'IdentityStoreBase.setIdentityIsSelected');
    try {
      return super.setIdentityIsSelected(index, isSelected: isSelected);
    } finally {
      _$IdentityStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateIdentityIsSelected(int nexIndex) {
    final _$actionInfo = _$IdentityStoreBaseActionController.startAction(
        name: 'IdentityStoreBase.updateIdentityIsSelected');
    try {
      return super.updateIdentityIsSelected(nexIndex);
    } finally {
      _$IdentityStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateSelectedIdentity(Identity identity) {
    final _$actionInfo = _$IdentityStoreBaseActionController.startAction(
        name: 'IdentityStoreBase.updateSelectedIdentity');
    try {
      return super.updateSelectedIdentity(identity);
    } finally {
      _$IdentityStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchLatestPoint() {
    final _$actionInfo = _$IdentityStoreBaseActionController.startAction(
        name: 'IdentityStoreBase.fetchLatestPoint');
    try {
      return super.fetchLatestPoint();
    } finally {
      _$IdentityStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
healthCertLastSelectIndex: ${healthCertLastSelectIndex},
identities: ${identities},
searchName: ${searchName},
selectedIdentity: ${selectedIdentity},
myName: ${myName},
myAddress: ${myAddress},
myBalance: ${myBalance},
selectedFirstIdentities: ${selectedFirstIdentities},
selectedFirstIdentitiesInHealthDApp: ${selectedFirstIdentitiesInHealthDApp}
    ''';
  }
}
