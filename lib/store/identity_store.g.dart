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
  Computed<String> _$selectedIdentityNameComputed;

  @override
  String get selectedIdentityName => (_$selectedIdentityNameComputed ??=
          Computed<String>(() => super.selectedIdentityName,
              name: 'IdentityStoreBase.selectedIdentityName'))
      .value;
  Computed<String> _$selectedIdentityAddressComputed;

  @override
  String get selectedIdentityAddress => (_$selectedIdentityAddressComputed ??=
          Computed<String>(() => super.selectedIdentityAddress,
              name: 'IdentityStoreBase.selectedIdentityAddress'))
      .value;
  Computed<Amount> _$selectedIdentityBalanceComputed;

  @override
  Amount get selectedIdentityBalance => (_$selectedIdentityBalanceComputed ??=
          Computed<Amount>(() => super.selectedIdentityBalance,
              name: 'IdentityStoreBase.selectedIdentityBalance'))
      .value;
  Computed<List<DecentralizedIdentity>> _$identitiesExceptSelectedComputed;

  @override
  List<DecentralizedIdentity> get identitiesExceptSelected =>
      (_$identitiesExceptSelectedComputed ??=
              Computed<List<DecentralizedIdentity>>(
                  () => super.identitiesExceptSelected,
                  name: 'IdentityStoreBase.identitiesExceptSelected'))
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

  final _$selectedIdentityAtom =
      Atom(name: 'IdentityStoreBase.selectedIdentity');

  @override
  Optional<DecentralizedIdentity> get selectedIdentity {
    _$selectedIdentityAtom.reportRead();
    return super.selectedIdentity;
  }

  @override
  set selectedIdentity(Optional<DecentralizedIdentity> value) {
    _$selectedIdentityAtom.reportWrite(value, super.selectedIdentity, () {
      super.selectedIdentity = value;
    });
  }

  final _$clearAsyncAction = AsyncAction('IdentityStoreBase.clear');

  @override
  Future<void> clear() {
    return _$clearAsyncAction.run(() => super.clear());
  }

  final _$addIdentityAsyncAction = AsyncAction('IdentityStoreBase.addIdentity');

  @override
  Future<DecentralizedIdentity> addIdentity(
      {@required DecentralizedIdentity identity}) {
    return _$addIdentityAsyncAction
        .run(() => super.addIdentity(identity: identity));
  }

  final _$selectIdentityAsyncAction =
      AsyncAction('IdentityStoreBase.selectIdentity');

  @override
  Future<void> selectIdentity(DecentralizedIdentity identity) {
    return _$selectIdentityAsyncAction
        .run(() => super.selectIdentity(identity));
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
selectedIdentity: ${selectedIdentity},
identitiesWithoutDapp: ${identitiesWithoutDapp},
identitiesWithDapp: ${identitiesWithDapp},
selectedIdentityName: ${selectedIdentityName},
selectedIdentityAddress: ${selectedIdentityAddress},
selectedIdentityBalance: ${selectedIdentityBalance},
identitiesExceptSelected: ${identitiesExceptSelected},
selectedFirstIdentitiesInHealthDApp: ${selectedFirstIdentitiesInHealthDApp}
    ''';
  }
}
