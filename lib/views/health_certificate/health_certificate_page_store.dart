import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:mobx/mobx.dart';
import 'package:tw_wallet_ui/global/common/util.dart';
import 'package:validators/validators.dart';

part 'health_certificate_page_store.g.dart';

class SelectOption extends EnumClass {
  static Serializer<SelectOption> get serializer => _$selectOptionSerializer;

  @BuiltValueEnumConst(wireName: 'Yes')
  static const SelectOption yes = _$yes;
  @BuiltValueEnumConst(wireName: 'No')
  static const SelectOption no = _$no;
  @BuiltValueEnumConst(wireName: 'NotSure')
  static const SelectOption notSure = _$notSure;

  const SelectOption._(String name) : super(name);

  static BuiltSet<SelectOption> get values => _$values;
  static SelectOption valueOf(String name) => _$valueOf(name);

  @override
  String toString() {
    switch (this) {
      case SelectOption.yes:
        return 'Yes';
      case SelectOption.no:
        return 'No';
      default:
        return 'NotSure';
    }
  }

  String description() {
    switch (this) {
      case SelectOption.yes:
        return '是';
      case SelectOption.no:
        return '否';
      default:
        return '不确定';
    }
  }
}

class HealthCertificatePageStore = _HealthCertificatePageStore
    with _$HealthCertificatePageStore;

abstract class _HealthCertificatePageStore with Store {
  final FormErrorState error = FormErrorState();

  @observable
  String phone;

  @observable
  String temperature;

  @observable
  SelectOption contactOption;

  @observable
  SelectOption symptomsOption;

  @observable
  bool hasCommitment;

  List<ReactionDisposer> _disposers;

  void setupDisposers() {
    _disposers = [
      reaction((_) => phone, validatePhone),
      reaction((_) => temperature, validateTemplate),
      reaction((_) => contactOption, validateContact),
      reaction((_) => symptomsOption, validateSymptoms),
      reaction((_) => hasCommitment, validateCommitment),
    ];
  }

  void dispose() {
    _disposers.forEach((dispose) => dispose());
  }

  @action
  void validatePhone(String value) {
    error.phone = isNull(value)
        ? '*手机号码不能为空'
        : Util.isValidPhone(phone) ? null : '*不是有效的手机号';
  }

  @action
  void validateTemplate(String value) {
    if (isNull(value)) {
      error.temperature = '*体温不能为空';
      return;
    }

    try {
      double res = double.parse(value);
      int indexOfDot = value.indexOf('.');
      if (res < 36 || res > 42) {
        error.temperature = '请输入 35 ~ 42℃ 范围内体温';
      } else if (indexOfDot >= 0 && value.length - indexOfDot > 2) {
        error.temperature = '体温仅支持 1 位小数';
      } else {
        error.temperature = null;
      }
    } catch (_) {
      error.temperature = '请输入有效的体温值';
    }
  }

  @action
  void validateContact(SelectOption value) {
    error.contact = value == null ? '*必选' : null;
  }

  @action
  void validateSymptoms(SelectOption value) {
    error.symptoms = value == null ? '*必选' : null;
  }

  @action
  void validateCommitment(bool value) {
    error.commitment = (value == null || !value) ? '*必选' : null;
  }

  @action
  validateAll() {
    validatePhone(phone);
    validateTemplate(temperature);
    validateContact(contactOption);
    validateSymptoms(symptomsOption);
    validateCommitment(hasCommitment);
  }
}

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String phone;

  @observable
  String temperature;

  @observable
  String contact;

  @observable
  String symptoms;

  @observable
  String commitment;

  @computed
  bool get hasErrors =>
      phone != null ||
      temperature != null ||
      contact != null ||
      symptoms != null ||
      commitment != null;
}
