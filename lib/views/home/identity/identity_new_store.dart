import 'package:mobx/mobx.dart';
import 'package:more/tuple.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/global/common/secure_storage.dart';
import 'package:tw_wallet_ui/global/service/blockchain.dart';
import 'package:tw_wallet_ui/global/store/identity_store.dart';
import 'package:tw_wallet_ui/models/identity.dart';
import 'package:validators/validators.dart';

part 'identity_new_store.g.dart';

final RegExp _regexPhone = RegExp(
    r'^(?:\+?86)?1(?:3\d{3}|5[^4\D]\d{2}|8\d{3}|7(?:[235-8]\d{2}|4(?:0\d|1[0-2]|9\d))|9[0135-9]\d{2}|66\d{2})\d{6}$');

class IdentityNewStore = _IdentityNewStore with _$IdentityNewStore;

abstract class _IdentityNewStore with Store {
  final FormErrorState error = FormErrorState();
  final _identityStore = getIt<IdentityStore>();

  @observable
  String name;

  @observable
  String phone;

  @observable
  String email;

  @observable
  String birthday;

  @computed
  bool get canNew => !error.hasErrors;

  List<ReactionDisposer> _disposers;

  void setupValidators() {
    _disposers = [
      reaction((_) => name, validateUsername),
      reaction((_) => phone, validatePhone),
      reaction((_) => email, validateEmail),
      reaction((_) => birthday, validateBirthday),
    ];
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validateUsername(name);
    validatePhone(phone);
    validateEmail(email);
    validateBirthday(birthday);
  }

  @action
  void validateUsername(String value) {
    if (isNull(value) || value.isEmpty) {
      error.username = '不能为空';
    } else {
      error.username = null;
    }
  }

  @action
  void validatePhone(String value) {
    error.phone = value != null
        ? _regexPhone.stringMatch(value) != null ? null : '不是有效的手机号'
        : null;
  }

  @action
  void validateEmail(String value) {
    error.email = value != null ? isEmail(value) ? null : '不是有效的电子邮件' : null;
  }

  @action
  void validateBirthday(String value) {
    error.birthday = value != null ? isDate(value) ? null : '不是有效的日期' : null;
  }

  @action
  Future<bool> addIdentity() async {
    validateAll();
    if (!error.hasErrors) {
      return await SecureStorage.get(SecureStorageItem.Mnemonics)
          .then((mnemonics) async {
        Tuple2<String, String> tuple = BlockChainService.generateIdentityKeys(
            BlockChainService.generateHDWallet(mnemonics), 0);

        await _identityStore.addIdentity(
            identity: Identity(
                name: name,
                pubKey: tuple.first,
                priKey: tuple.second,
                phone: phone,
                email: email,
                birthday: isNull(birthday) ? null : DateTime.parse(birthday)));

        return true;
      });
    }
    return false;
  }
}

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String username;

  @observable
  String phone;

  @observable
  String email;

  @observable
  String birthday;

  @computed
  bool get hasErrors =>
      username != null || phone != null || email != null || birthday != null;
}
