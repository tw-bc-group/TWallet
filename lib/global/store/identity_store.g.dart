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

  final _$selectedNameAtom = Atom(name: 'IdentityStoreBase.selectedName');

  @override
  String get selectedName {
    _$selectedNameAtom.context.enforceReadPolicy(_$selectedNameAtom);
    _$selectedNameAtom.reportObserved();
    return super.selectedName;
  }

  @override
  set selectedName(String value) {
    _$selectedNameAtom.context.conditionallyRunInAction(() {
      super.selectedName = value;
      _$selectedNameAtom.reportChanged();
    }, _$selectedNameAtom, name: '${_$selectedNameAtom.name}_set');
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

  final _$clearAsyncAction = AsyncAction('clear');

  @override
  Future<void> clear() {
    return _$clearAsyncAction.run(() => super.clear());
  }

  final _$selectIdentityAsyncAction = AsyncAction('selectIdentity');

  @override
  Future<void> selectIdentity({@required String name}) {
    return _$selectIdentityAsyncAction
        .run(() => super.selectIdentity(name: name));
  }

  final _$addIdentityAsyncAction = AsyncAction('addIdentity');

  @override
  Future<void> addIdentity({@required Identity identity}) {
    return _$addIdentityAsyncAction
        .run(() => super.addIdentity(identity: identity));
  }

  final _$deleteIdentityAsyncAction = AsyncAction('deleteIdentity');

  @override
  Future<void> deleteIdentity({@required String name}) {
    return _$deleteIdentityAsyncAction
        .run(() => super.deleteIdentity(name: name));
  }

  final _$IdentityStoreBaseActionController =
      ActionController(name: 'IdentityStoreBase');

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
        'selectedName: ${selectedName.toString()},identities: ${identities.toString()},selectedIdentity: ${selectedIdentity.toString()}';
    return '{$string}';
  }
}
