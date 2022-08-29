// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IdentityStore on IdentityStoreBase, Store {
  Computed<List<DecentralizedIdentity>>? _$identitiesWithoutDappComputed;

  @override
  List<DecentralizedIdentity> get identitiesWithoutDapp =>
      (_$identitiesWithoutDappComputed ??=
              Computed<List<DecentralizedIdentity>>(
                  () => super.identitiesWithoutDapp,
                  name: 'IdentityStoreBase.identitiesWithoutDapp'))
          .value;
  Computed<List<DecentralizedIdentity>>? _$identitiesWithDappComputed;

  @override
  List<DecentralizedIdentity> get identitiesWithDapp =>
      (_$identitiesWithDappComputed ??= Computed<List<DecentralizedIdentity>>(
              () => super.identitiesWithDapp,
              name: 'IdentityStoreBase.identitiesWithDapp'))
          .value;
  Computed<String>? _$selectedIdentityNameComputed;

  @override
  String get selectedIdentityName => (_$selectedIdentityNameComputed ??=
          Computed<String>(() => super.selectedIdentityName,
              name: 'IdentityStoreBase.selectedIdentityName'))
      .value;
  Computed<String>? _$selectedIdentityAddressComputed;

  @override
  String get selectedIdentityAddress => (_$selectedIdentityAddressComputed ??=
          Computed<String>(() => super.selectedIdentityAddress,
              name: 'IdentityStoreBase.selectedIdentityAddress'))
      .value;
  Computed<String>? _$selectedIdentityDidComputed;

  @override
  String get selectedIdentityDid => (_$selectedIdentityDidComputed ??=
          Computed<String>(() => super.selectedIdentityDid,
              name: 'IdentityStoreBase.selectedIdentityDid'))
      .value;
  Computed<Amount>? _$selectedIdentityBalanceComputed;

  @override
  Amount get selectedIdentityBalance => (_$selectedIdentityBalanceComputed ??=
          Computed<Amount>(() => super.selectedIdentityBalance,
              name: 'IdentityStoreBase.selectedIdentityBalance'))
      .value;
  Computed<List<DecentralizedIdentity>>? _$identitiesExceptSelectedComputed;

  @override
  List<DecentralizedIdentity> get identitiesExceptSelected =>
      (_$identitiesExceptSelectedComputed ??=
              Computed<List<DecentralizedIdentity>>(
                  () => super.identitiesExceptSelected,
                  name: 'IdentityStoreBase.identitiesExceptSelected'))
          .value;
  Computed<List<DecentralizedIdentity>>?
      _$selectedFirstIdentitiesInHealthDAppComputed;

  @override
  List<DecentralizedIdentity> get selectedFirstIdentitiesInHealthDApp =>
      (_$selectedFirstIdentitiesInHealthDAppComputed ??=
              Computed<List<DecentralizedIdentity>>(
                  () => super.selectedFirstIdentitiesInHealthDApp,
                  name:
                      'IdentityStoreBase.selectedFirstIdentitiesInHealthDApp'))
          .value;

  late final _$healthCertLastSelectIndexAtom = Atom(
      name: 'IdentityStoreBase.healthCertLastSelectIndex', context: context);

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

  late final _$identitiesAtom =
      Atom(name: 'IdentityStoreBase.identities', context: context);

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

  late final _$searchNameAtom =
      Atom(name: 'IdentityStoreBase.searchName', context: context);

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

  late final _$selectedIdentityAtom =
      Atom(name: 'IdentityStoreBase.selectedIdentity', context: context);

  @override
  DecentralizedIdentity? get selectedIdentity {
    _$selectedIdentityAtom.reportRead();
    return super.selectedIdentity;
  }

  @override
  set selectedIdentity(DecentralizedIdentity? value) {
    _$selectedIdentityAtom.reportWrite(value, super.selectedIdentity, () {
      super.selectedIdentity = value;
    });
  }

  late final _$clearAsyncAction =
      AsyncAction('IdentityStoreBase.clear', context: context);

  @override
  Future<void> clear() {
    return _$clearAsyncAction.run(() => super.clear());
  }

  late final _$addIdentityAsyncAction =
      AsyncAction('IdentityStoreBase.addIdentity', context: context);

  @override
  Future<DecentralizedIdentity> addIdentity(
      {required DecentralizedIdentity identity}) {
    return _$addIdentityAsyncAction
        .run(() => super.addIdentity(identity: identity));
  }

  late final _$selectIdentityAsyncAction =
      AsyncAction('IdentityStoreBase.selectIdentity', context: context);

  @override
  Future<void> selectIdentity(DecentralizedIdentity identity) {
    return _$selectIdentityAsyncAction
        .run(() => super.selectIdentity(identity));
  }

  late final _$updateIdentityAsyncAction =
      AsyncAction('IdentityStoreBase.updateIdentity', context: context);

  @override
  Future<void> updateIdentity(DecentralizedIdentity identity) {
    return _$updateIdentityAsyncAction
        .run(() => super.updateIdentity(identity));
  }

  late final _$updateHealthCertLastSelectedAsyncAction = AsyncAction(
      'IdentityStoreBase.updateHealthCertLastSelected',
      context: context);

  @override
  Future<dynamic> updateHealthCertLastSelected(DecentralizedIdentity identity) {
    return _$updateHealthCertLastSelectedAsyncAction
        .run(() => super.updateHealthCertLastSelected(identity));
  }

  late final _$IdentityStoreBaseActionController =
      ActionController(name: 'IdentityStoreBase', context: context);

  @override
  void fetchLatestPoint({bool? withLoading}) {
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
selectedIdentityDid: ${selectedIdentityDid},
selectedIdentityBalance: ${selectedIdentityBalance},
identitiesExceptSelected: ${identitiesExceptSelected},
selectedFirstIdentitiesInHealthDApp: ${selectedFirstIdentitiesInHealthDApp}
    ''';
  }
}
