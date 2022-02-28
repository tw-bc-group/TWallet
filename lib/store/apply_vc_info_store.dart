import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:tw_wallet_ui/common/util.dart';
import 'package:tw_wallet_ui/models/vc_type_response.dart';
import 'package:tw_wallet_ui/models/verifiable_credential.dart';
import 'package:tw_wallet_ui/service/api_provider.dart';
import 'package:tw_wallet_ui/service/ssi.dart';
import 'package:tw_wallet_ui/store/issuer_store.dart';
import 'package:tw_wallet_ui/store/vc_store.dart';
import 'package:validators/validators.dart';

part 'apply_vc_info_store.g.dart';

class ApplyVcInfoStore = _ApplyVcInfoStore with _$ApplyVcInfoStore;

abstract class _ApplyVcInfoStore with Store {
  final FormErrorState error = FormErrorState();
  final Rx<VcType?> rxVcType = Rx(null);

  set vcType(VcType vcType) => rxVcType.value = vcType;
  VcType get vcType => rxVcType.value!;

  @observable
  String name = '';

  @observable
  String phone = '';

  late List<ReactionDisposer> _disposers;

  void setErrorResetDispatchers() {
    _disposers = [
      reaction((_) => name, resetNameError),
      reaction((_) => phone, resetPhoneError),
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
  }

  @action
  void clearError() {
    error.username = null;
    error.phone = null;
  }

  @action
  void resetNameError(String value) {
    error.username = null;
  }

  @action
  void resetPhoneError(String value) {
    error.phone = null;
  }

  void validateUsername(String value) {
    if (isNull(value) || value.isEmpty) {
      error.username = '不能为空';
    } else if (value.length < 2) {
      error.username = '长度至少为2';
    } else {
      error.username = null;
    }
  }

  void validatePhone(String value) {
    error.phone = value.isNotEmpty
        ? Util.isValidPhone(phone)
            ? null
            : '不是有效的手机号'
        : null;
  }

  @action
  Future<dynamic> applyNewVc() async {
    final ApiProvider _apiProvider = Get.find<ApiProvider>();
    final VcStore _vcStore = Get.find();
    final IssuerStore _issuerStore = Get.find();

    const mockIssuerId = 'did:tw:mockIssuerId';

    return _apiProvider
        .applyVc(
      vcType.id,
      mockIssuerId,
      SsiService.getSelectDid(),
      name,
      phone,
    )
        .then((res) {
      bool success = false;
      res.ifPresent((tokenResponse) {
        _vcStore.addVc(
          VerifiableCredential(
            name: vcType.name,
            issuer: _issuerStore.getIssuerNameByVcTypeId(vcType.id),
            vcTypeId: vcType.id,
            token: tokenResponse.token,
            content: vcType.content.toList(),
            applicationTime: DateTime.now(),
          ),
        );
        success = true;
      });
      return success;
    });
  }
}

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String? username;

  @observable
  String? phone;

  @computed
  bool get hasErrors => username != null || phone != null;
}
