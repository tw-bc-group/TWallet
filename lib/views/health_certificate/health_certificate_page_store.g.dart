// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_certificate_page_store.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SelectOption _$yes = const SelectOption._('yes');
const SelectOption _$no = const SelectOption._('no');
const SelectOption _$notSure = const SelectOption._('notSure');

SelectOption _$valueOf(String name) {
  switch (name) {
    case 'yes':
      return _$yes;
    case 'no':
      return _$no;
    case 'notSure':
      return _$notSure;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<SelectOption> _$values =
    new BuiltSet<SelectOption>(const <SelectOption>[
  _$yes,
  _$no,
  _$notSure,
]);

Serializer<SelectOption> _$selectOptionSerializer =
    new _$SelectOptionSerializer();

class _$SelectOptionSerializer implements PrimitiveSerializer<SelectOption> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'yes': 'Yes',
    'no': 'No',
    'notSure': 'NotSure',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'Yes': 'yes',
    'No': 'no',
    'NotSure': 'notSure',
  };

  @override
  final Iterable<Type> types = const <Type>[SelectOption];
  @override
  final String wireName = 'SelectOption';

  @override
  Object serialize(Serializers serializers, SelectOption object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  SelectOption deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SelectOption.valueOf(_fromWire[serialized] ?? serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HealthCertificatePageStore on _HealthCertificatePageStore, Store {
  final _$phoneAtom = Atom(name: '_HealthCertificatePageStore.phone');

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$temperatureAtom =
      Atom(name: '_HealthCertificatePageStore.temperature');

  @override
  String get temperature {
    _$temperatureAtom.reportRead();
    return super.temperature;
  }

  @override
  set temperature(String value) {
    _$temperatureAtom.reportWrite(value, super.temperature, () {
      super.temperature = value;
    });
  }

  final _$contactOptionAtom =
      Atom(name: '_HealthCertificatePageStore.contactOption');

  @override
  SelectOption get contactOption {
    _$contactOptionAtom.reportRead();
    return super.contactOption;
  }

  @override
  set contactOption(SelectOption value) {
    _$contactOptionAtom.reportWrite(value, super.contactOption, () {
      super.contactOption = value;
    });
  }

  final _$symptomsOptionAtom =
      Atom(name: '_HealthCertificatePageStore.symptomsOption');

  @override
  SelectOption get symptomsOption {
    _$symptomsOptionAtom.reportRead();
    return super.symptomsOption;
  }

  @override
  set symptomsOption(SelectOption value) {
    _$symptomsOptionAtom.reportWrite(value, super.symptomsOption, () {
      super.symptomsOption = value;
    });
  }

  final _$hasCommitmentAtom =
      Atom(name: '_HealthCertificatePageStore.hasCommitment');

  @override
  bool get hasCommitment {
    _$hasCommitmentAtom.reportRead();
    return super.hasCommitment;
  }

  @override
  set hasCommitment(bool value) {
    _$hasCommitmentAtom.reportWrite(value, super.hasCommitment, () {
      super.hasCommitment = value;
    });
  }

  final _$_HealthCertificatePageStoreActionController =
      ActionController(name: '_HealthCertificatePageStore');

  @override
  void validatePhone(String value) {
    final _$actionInfo = _$_HealthCertificatePageStoreActionController
        .startAction(name: '_HealthCertificatePageStore.validatePhone');
    try {
      return super.validatePhone(value);
    } finally {
      _$_HealthCertificatePageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateTemplate(String value) {
    final _$actionInfo = _$_HealthCertificatePageStoreActionController
        .startAction(name: '_HealthCertificatePageStore.validateTemplate');
    try {
      return super.validateTemplate(value);
    } finally {
      _$_HealthCertificatePageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateContact(SelectOption value) {
    final _$actionInfo = _$_HealthCertificatePageStoreActionController
        .startAction(name: '_HealthCertificatePageStore.validateContact');
    try {
      return super.validateContact(value);
    } finally {
      _$_HealthCertificatePageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateSymptoms(SelectOption value) {
    final _$actionInfo = _$_HealthCertificatePageStoreActionController
        .startAction(name: '_HealthCertificatePageStore.validateSymptoms');
    try {
      return super.validateSymptoms(value);
    } finally {
      _$_HealthCertificatePageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateCommitment(bool value) {
    final _$actionInfo = _$_HealthCertificatePageStoreActionController
        .startAction(name: '_HealthCertificatePageStore.validateCommitment');
    try {
      return super.validateCommitment(value);
    } finally {
      _$_HealthCertificatePageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validateAll() {
    final _$actionInfo = _$_HealthCertificatePageStoreActionController
        .startAction(name: '_HealthCertificatePageStore.validateAll');
    try {
      return super.validateAll();
    } finally {
      _$_HealthCertificatePageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
phone: ${phone},
temperature: ${temperature},
contactOption: ${contactOption},
symptomsOption: ${symptomsOption},
hasCommitment: ${hasCommitment}
    ''';
  }
}

mixin _$FormErrorState on _FormErrorState, Store {
  Computed<bool> _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_FormErrorState.hasErrors'))
          .value;

  final _$phoneAtom = Atom(name: '_FormErrorState.phone');

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$temperatureAtom = Atom(name: '_FormErrorState.temperature');

  @override
  String get temperature {
    _$temperatureAtom.reportRead();
    return super.temperature;
  }

  @override
  set temperature(String value) {
    _$temperatureAtom.reportWrite(value, super.temperature, () {
      super.temperature = value;
    });
  }

  final _$contactAtom = Atom(name: '_FormErrorState.contact');

  @override
  String get contact {
    _$contactAtom.reportRead();
    return super.contact;
  }

  @override
  set contact(String value) {
    _$contactAtom.reportWrite(value, super.contact, () {
      super.contact = value;
    });
  }

  final _$symptomsAtom = Atom(name: '_FormErrorState.symptoms');

  @override
  String get symptoms {
    _$symptomsAtom.reportRead();
    return super.symptoms;
  }

  @override
  set symptoms(String value) {
    _$symptomsAtom.reportWrite(value, super.symptoms, () {
      super.symptoms = value;
    });
  }

  final _$commitmentAtom = Atom(name: '_FormErrorState.commitment');

  @override
  String get commitment {
    _$commitmentAtom.reportRead();
    return super.commitment;
  }

  @override
  set commitment(String value) {
    _$commitmentAtom.reportWrite(value, super.commitment, () {
      super.commitment = value;
    });
  }

  @override
  String toString() {
    return '''
phone: ${phone},
temperature: ${temperature},
contact: ${contact},
symptoms: ${symptoms},
commitment: ${commitment},
hasErrors: ${hasErrors}
    ''';
  }
}
