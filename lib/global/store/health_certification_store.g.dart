// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_certification_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HealthCertificationStore on _HealthCertificationStore, Store {
  Computed<bool> _$isHealthyComputed;

  @override
  bool get isHealthy =>
      (_$isHealthyComputed ??= Computed<bool>(() => super.isHealthy)).value;

  final _$healthCertificationAtom =
      Atom(name: '_HealthCertificationStore.healthCertification');

  @override
  HealthCertification get healthCertification {
    _$healthCertificationAtom.context
        .enforceReadPolicy(_$healthCertificationAtom);
    _$healthCertificationAtom.reportObserved();
    return super.healthCertification;
  }

  @override
  set healthCertification(HealthCertification value) {
    _$healthCertificationAtom.context.conditionallyRunInAction(() {
      super.healthCertification = value;
      _$healthCertificationAtom.reportChanged();
    }, _$healthCertificationAtom,
        name: '${_$healthCertificationAtom.name}_set');
  }

  final _$isBoundCertAtom = Atom(name: '_HealthCertificationStore.isBoundCert');

  @override
  bool get isBoundCert {
    _$isBoundCertAtom.context.enforceReadPolicy(_$isBoundCertAtom);
    _$isBoundCertAtom.reportObserved();
    return super.isBoundCert;
  }

  @override
  set isBoundCert(bool value) {
    _$isBoundCertAtom.context.conditionallyRunInAction(() {
      super.isBoundCert = value;
      _$isBoundCertAtom.reportChanged();
    }, _$isBoundCertAtom, name: '${_$isBoundCertAtom.name}_set');
  }

  final _$bindHealthCertAsyncAction = AsyncAction('bindHealthCert');

  @override
  Future<dynamic> bindHealthCert(String did, String phone) {
    return _$bindHealthCertAsyncAction
        .run(() => super.bindHealthCert(did, phone));
  }

  final _$fetchHealthCertAsyncAction = AsyncAction('fetchHealthCert');

  @override
  Future<dynamic> fetchHealthCert(String did) {
    return _$fetchHealthCertAsyncAction.run(() => super.fetchHealthCert(did));
  }

  final _$fetchLatestHealthCertAsyncAction =
      AsyncAction('fetchLatestHealthCert');

  @override
  Future<dynamic> fetchLatestHealthCert(String did) {
    return _$fetchLatestHealthCertAsyncAction
        .run(() => super.fetchLatestHealthCert(did));
  }

  @override
  String toString() {
    final string =
        'healthCertification: ${healthCertification.toString()},isBoundCert: ${isBoundCert.toString()},isHealthy: ${isHealthy.toString()}';
    return '{$string}';
  }
}
