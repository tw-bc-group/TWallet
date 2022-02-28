// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HealthInfo> _$healthInfoSerializer = new _$HealthInfoSerializer();

class _$HealthInfoSerializer implements StructuredSerializer<HealthInfo> {
  @override
  final Iterable<Type> types = const [HealthInfo, _$HealthInfo];
  @override
  final String wireName = 'HealthInfo';

  @override
  Iterable<Object?> serialize(Serializers serializers, HealthInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.healthCertificateStatus;
    if (value != null) {
      result
        ..add('healthCertificateStatus')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.healthStatus;
    if (value != null) {
      result
        ..add('healthStatus')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  HealthInfo deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HealthInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'healthCertificateStatus':
          result.healthCertificateStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'healthStatus':
          result.healthStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$HealthInfo extends HealthInfo {
  @override
  final String? healthCertificateStatus;
  @override
  final String? healthStatus;

  factory _$HealthInfo([void Function(HealthInfoBuilder)? updates]) =>
      (new HealthInfoBuilder()..update(updates)).build();

  _$HealthInfo._({this.healthCertificateStatus, this.healthStatus}) : super._();

  @override
  HealthInfo rebuild(void Function(HealthInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HealthInfoBuilder toBuilder() => new HealthInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HealthInfo &&
        healthCertificateStatus == other.healthCertificateStatus &&
        healthStatus == other.healthStatus;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc(0, healthCertificateStatus.hashCode), healthStatus.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HealthInfo')
          ..add('healthCertificateStatus', healthCertificateStatus)
          ..add('healthStatus', healthStatus))
        .toString();
  }
}

class HealthInfoBuilder implements Builder<HealthInfo, HealthInfoBuilder> {
  _$HealthInfo? _$v;

  String? _healthCertificateStatus;
  String? get healthCertificateStatus => _$this._healthCertificateStatus;
  set healthCertificateStatus(String? healthCertificateStatus) =>
      _$this._healthCertificateStatus = healthCertificateStatus;

  String? _healthStatus;
  String? get healthStatus => _$this._healthStatus;
  set healthStatus(String? healthStatus) => _$this._healthStatus = healthStatus;

  HealthInfoBuilder();

  HealthInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _healthCertificateStatus = $v.healthCertificateStatus;
      _healthStatus = $v.healthStatus;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HealthInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HealthInfo;
  }

  @override
  void update(void Function(HealthInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HealthInfo build() {
    final _$result = _$v ??
        new _$HealthInfo._(
            healthCertificateStatus: healthCertificateStatus,
            healthStatus: healthStatus);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
