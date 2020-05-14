import 'package:avataaar_image/avataaar_image.dart';
import 'package:mobx/mobx.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/global/common/util.dart';
import 'package:tw_wallet_ui/global/store/identity_store.dart';
import 'package:tw_wallet_ui/global/store/mnemonics.dart';
import 'package:tw_wallet_ui/models/identity.dart';
import 'package:tw_wallet_ui/views/home/identity/date_validator.dart';
import 'package:uuid/uuid.dart';
import 'package:validators/validators.dart';

part 'identity_new_store.g.dart';

class IdentityNewStore = _IdentityNewStore with _$IdentityNewStore;

abstract class _IdentityNewStore with Store {
  final FormErrorState error = FormErrorState();
  final _identityStore = getIt<IdentityStore>();

  @observable
  Avataaar avatar;

  @observable
  String name;

  @observable
  String phone;

  @observable
  String email;

  @observable
  String birthday;

  List<ReactionDisposer> _disposers;

  void setupAvatarAndValidators() {
    refreshAvatar();

    _disposers = [
      reaction((_) => name, validateUsername),
      reaction((_) => phone, validatePhone),
      reaction((_) => email, validateEmail),
      reaction((_) => birthday, validateBirthday),
    ];
  }

  //TODO:
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
  void refreshAvatar() {
    avatar = Avataaar.random(style: Style.circle);
  }

  @action
  void validateUsername(String value) {
    if (isNull(value) || value.isEmpty) {
      error.username = '不能为空';
    } else if (_identityStore.identities
        .any((identity) => identity.name == value)) {
      error.username = '此名称已存在';
    } else {
      error.username = null;
    }
  }

  @action
  void validatePhone(String value) {
    error.phone =
        value != null ? Util.isValidPhone(phone) ? null : '不是有效的手机号' : null;
  }

  @action
  void validateEmail(String value) {
    error.email = value != null ? isEmail(value) ? null : '不是有效的电子邮件' : null;
  }

  @action
  void validateBirthday(String value) {
    error.birthday =
        value != null ? isValidDate(value) ? null : '不是有效的日期' : null;
  }

  @action
  Future<bool> addIdentity() async {
    MnemonicsStore store = getIt<MnemonicsStore>();

    if (!error.hasErrors) {
      return store.generateIdentityKeys().then((keys) {
        return Future.value(Identity((identity) => identity
          ..id = Uuid().v1()
          ..avatar = avatar.toJson()
          ..name = name
          ..pubKey = keys.first
          ..priKey = keys.second
          ..phone = phone
          ..email = email
          ..birthday = birthday)).then((identity) {
          return identity.register().then((success) {
            if (success) {
              _identityStore.addIdentity(identity: identity);
            }
            return success;
          });
        });
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
