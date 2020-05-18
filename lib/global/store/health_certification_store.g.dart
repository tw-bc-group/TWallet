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
      (_$isHealthyComputed ??= Computed<bool>(() => super.isHealthy,
              name: '_HealthCertificationStore.isHealthy'))
          .value;

  final _$healthCertificationAtom =
      Atom(name: '_HealthCertificationStore.healthCertification');

  @override
  HealthCertification get healthCertification {
    _$healthCertificationAtom.reportRead();
    return super.healthCertification;
  }

  @override
  set healthCertification(HealthCertification value) {
    _$healthCertificationAtom.reportWrite(value, super.healthCertification, () {
      super.healthCertification = value;
    });
  }

  final _$isBoundCertAtom = Atom(name: '_HealthCertificationStore.isBoundCert');

  @override
  bool get isBoundCert {
    _$isBoundCertAtom.reportRead();
    return super.isBoundCert;
  }

  @override
  set isBoundCert(bool value) {
    _$isBoundCertAtom.reportWrite(value, super.isBoundCert, () {
      super.isBoundCert = value;
    });
  }

  final _$bindHealthCertAsyncAction =
      AsyncAction('_HealthCertificationStore.bindHealthCert');

  @override
  Future<dynamic> bindHealthCert(String did, String phone, double temperature,
      String contact, String symptoms) {
    return _$bindHealthCertAsyncAction.run(
        () => super.bindHealthCert(did, phone, temperature, contact, symptoms));
  }

  final _$fetchHealthCertAsyncAction =
      AsyncAction('_HealthCertificationStore.fetchHealthCert');

  @override
  Future<dynamic> fetchHealthCert(String did) {
    return _$fetchHealthCertAsyncAction.run(() => super.fetchHealthCert(did));
  }

  final _$fetchLatestHealthCertAsyncAction =
      AsyncAction('_HealthCertificationStore.fetchLatestHealthCert');

  @override
  Future<dynamic> fetchLatestHealthCert(String did) {
    return _$fetchLatestHealthCertAsyncAction
        .run(() => super.fetchLatestHealthCert(did));
  }

  @override
  String toString() {
    return '''
healthCertification: ${healthCertification},
isBoundCert: ${isBoundCert},
isHealthy: ${isHealthy}
    ''';
  }
}
