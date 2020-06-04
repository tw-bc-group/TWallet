import 'package:mobx/mobx.dart';
import 'package:tw_wallet_ui/models/did.dart';
import 'package:tw_wallet_ui/store/env_store.dart';

part 'transfer_store.g.dart';

class TransferStore = _TransferStore with _$TransferStore;

abstract class _TransferStore with Store {
  final FormErrorState error = FormErrorState();

  @observable
  String payerDID;

  @observable
  String balance;

  @observable
  String amount;

  @observable
  String payeeDID;

  List<ReactionDisposer> _disposers;

  void setupErrorDisposers() {
    _disposers = [
      reaction((_) => amount, resetAmountError),
      reaction((_) => payeeDID, resetAddressError),
    ];
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validateAmount(amount);
    validatePayeeDID(payeeDID);
  }

  @action
  void resetAmountError(String value) {
    error.amount = null;
  }

  @action
  void resetAddressError(String value) {
    error.payeeDID = null;
  }

  @action
  void validateAmount(String value) {
    try {
      final double res = double.parse(value);
      final int indexOfDot = value.indexOf('.');
      if (res <= 0) {
        error.amount = '请输入大于 0 的金额';
      } else if (res > double.parse(balance)) {
        error.amount = '金额超过您目前的余额';
      } else if (indexOfDot >= 0 &&
          value.length - indexOfDot >
              globalEnv().tokenHumanReadablePrecision + 1) {
        error.amount = '金额仅支持 ${globalEnv().tokenHumanReadablePrecision} 位小数';
      } else if (value.endsWith('.')) {
        throw Error();
      } else {
        error.amount = null;
      }
    } catch (_) {
      error.amount = '请输入有效的金额';
    }
  }

  @action
  void validatePayeeDID(String value) {
    try {
      if (value == payerDID) {
        error.payeeDID = '收款人账户不能与付款人账户相同';
        return;
      }
      DID.parse(value);
      error.payeeDID = null;
    } catch (_) {
      error.payeeDID = '请输入有效的接收账户';
      return;
    }
  }
}

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String amount;

  @observable
  String payeeDID;

  @computed
  bool get hasErrors => amount != null || payeeDID != null;
}
