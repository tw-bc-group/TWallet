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

  final _$tokenAtom = Atom(name: '_HealthCertificationStore.token');

  @override
  HealthCertificationToken get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(HealthCertificationToken value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
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
  Future<HealthCertificationToken> bindHealthCert(String did, String phone,
      double temperature, String contact, String symptoms) {
    return _$bindHealthCertAsyncAction.run(
        () => super.bindHealthCert(did, phone, temperature, contact, symptoms));
  }

  final _$fetchHealthCertByDIDAsyncAction =
      AsyncAction('_HealthCertificationStore.fetchHealthCertByDID');

  @override
  Future<dynamic> fetchHealthCertByDID(String did) {
    return _$fetchHealthCertByDIDAsyncAction
        .run(() => super.fetchHealthCertByDID(did));
  }

  final _$fetchLatestHealthCertAsyncAction =
      AsyncAction('_HealthCertificationStore.fetchLatestHealthCert');

  @override
  Future<HealthCertificationToken> fetchLatestHealthCert(String did) {
    return _$fetchLatestHealthCertAsyncAction
        .run(() => super.fetchLatestHealthCert(did));
  }

  @override
  String toString() {
    return '''
token: ${token},
isBoundCert: ${isBoundCert},
isHealthy: ${isHealthy}
    ''';
  }
}
