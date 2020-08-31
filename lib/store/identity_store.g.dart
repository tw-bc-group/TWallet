// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$IdentityStore on IdentityStoreBase, Store {
  Computed<List<DecentralizedIdentity>> _$identitiesWithoutDappComputed;

  @override
  List<DecentralizedIdentity> get identitiesWithoutDapp =>
      (_$identitiesWithoutDappComputed ??=
              Computed<List<DecentralizedIdentity>>(
                  () => super.identitiesWithoutDapp,
                  name: 'IdentityStoreBase.identitiesWithoutDapp'))
          .value;
  Computed<List<DecentralizedIdentity>> _$identitiesWithDappComputed;

  @override
  List<DecentralizedIdentity> get identitiesWithDapp =>
      (_$identitiesWithDappComputed ??= Computed<List<DecentralizedIdentity>>(
              () => super.identitiesWithDapp,
              name: 'IdentityStoreBase.identitiesWithDapp'))
          .value;
  Computed<Optional<DecentralizedIdentity>> _$selectedIdentityComputed;

  @override
  Optional<DecentralizedIdentity> get selectedIdentity =>
      (_$selectedIdentityComputed ??= Computed<Optional<DecentralizedIdentity>>(
              () => super.selectedIdentity,
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
  Computed<List<DecentralizedIdentity>> _$selectedFirstIdentitiesComputed;

  @override
  List<DecentralizedIdentity> get selectedFirstIdentities =>
      (_$selectedFirstIdentitiesComputed ??=
              Computed<List<DecentralizedIdentity>>(
                  () => super.selectedFirstIdentities,
                  name: 'IdentityStoreBase.selectedFirstIdentities'))
          .value;
  Computed<List<DecentralizedIdentity>>
      _$selectedFirstIdentitiesInHealthDAppComputed;

  @override
  List<DecentralizedIdentity> get selectedFirstIdentitiesInHealthDApp =>
      (_$selectedFirstIdentitiesInHealthDAppComputed ??=
              Computed<List<DecentralizedIdentity>>(
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
  ObservableList<DecentralizedIdentity> get identities {
    _$identitiesAtom.reportRead();
    return super.identities;
  }

  @override
  set identities(ObservableList<DecentralizedIdentity> value) {
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

  final _$updateIdentityIsSelectedAsyncAction =
      AsyncAction('IdentityStoreBase.updateIdentityIsSelected');

  @override
  Future<void> updateIdentityIsSelected(int selectedIndex) {
    return _$updateIdentityIsSelectedAsyncAction
        .run(() => super.updateIdentityIsSelected(selectedIndex));
  }

  final _$addIdentityAsyncAction = AsyncAction('IdentityStoreBase.addIdentity');

  @override
  Future<DecentralizedIdentity> addIdentity(
      {@required DecentralizedIdentity identity}) {
    return _$addIdentityAsyncAction
        .run(() => super.addIdentity(identity: identity));
  }

  final _$updateIdentityAsyncAction =
      AsyncAction('IdentityStoreBase.updateIdentity');

  @override
  Future<void> updateIdentity(DecentralizedIdentity identity) {
    return _$updateIdentityAsyncAction
        .run(() => super.updateIdentity(identity));
  }

  final _$updateHealthCertLastSelectedAsyncAction =
      AsyncAction('IdentityStoreBase.updateHealthCertLastSelected');

  @override
  Future<dynamic> updateHealthCertLastSelected(DecentralizedIdentity identity) {
    return _$updateHealthCertLastSelectedAsyncAction
        .run(() => super.updateHealthCertLastSelected(identity));
  }

  final _$IdentityStoreBaseActionController =
      ActionController(name: 'IdentityStoreBase');

  @override
  void updateSelectedIdentity(DecentralizedIdentity identity) {
    final _$actionInfo = _$IdentityStoreBaseActionController.startAction(
        name: 'IdentityStoreBase.updateSelectedIdentity');
    try {
      return super.updateSelectedIdentity(identity);
    } finally {
      _$IdentityStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectIdentity(String name) {
    final _$actionInfo = _$IdentityStoreBaseActionController.startAction(
        name: 'IdentityStoreBase.selectIdentity');
    try {
      return super.selectIdentity(name);
    } finally {
      _$IdentityStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchLatestPoint({bool withLoading}) {
    final _$actionInfo = _$IdentityStoreBaseActionController.startAction(
        name: 'IdentityStoreBase.fetchLatestPoint');
    try {
      return super.fetchLatestPoint(withLoading: withLoading);
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
identitiesWithoutDapp: ${identitiesWithoutDapp},
identitiesWithDapp: ${identitiesWithDapp},
selectedIdentity: ${selectedIdentity},
myName: ${myName},
myAddress: ${myAddress},
myBalance: ${myBalance},
selectedFirstIdentities: ${selectedFirstIdentities},
selectedFirstIdentitiesInHealthDApp: ${selectedFirstIdentitiesInHealthDApp}
    ''';
  }
}
