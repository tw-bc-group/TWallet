import 'package:mobx/mobx.dart';
import 'package:tw_wallet_ui/store/env_store.dart';
import 'package:web3dart/credentials.dart';

part 'transfer_store.g.dart';

class TransferStore = _TransferStore with _$TransferStore;

abstract class _TransferStore with Store {
  final FormErrorState error = FormErrorState();

  @observable
  String payerAddress;

  @observable
  String balance;

  @observable
  String amount;

  @observable
  String payeeAddress;

  List<ReactionDisposer> _disposers;

  void setupErrorReseters() {
    _disposers = [
      reaction((_) => amount, resetAmountError),
      reaction((_) => payeeAddress, resetAddressError),
    ];
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validateAmount(amount);
    validatePayeeAddress(payeeAddress);
  }

  @action
  void resetAmountError(String value) {
    error.amount = null;
  }
  
  @action
  void resetAddressError(String value) {
    error.payeeAddress = null;
  }

  @action
  void updateBalance(String value) {
    balance = value;
  }

  @action
  void updatePayerAddress(String value) {
    payerAddress = value.startsWith('0x') ? value : '0x$value';
  }

  @action
  void updatePayeeAddress(String value) {
    payeeAddress = value.startsWith('0x') ? value : '0x$value';
  }

  @action
  void validateAmount(String value) {
    try {
      double res = double.parse(value);
      int indexOfDot = value.indexOf('.');
      if (res <= 0) {
        error.amount = '请输入大于 0 的金额';
      } else if (res > double.parse(balance)) {
        error.amount = '金额不能大于当前余额';
      } else if (indexOfDot >= 0 &&
          value.length - indexOfDot >
              globalEnv().tokenHumanReadablePrecision + 1) {
        error.amount = '金额仅支持 ${globalEnv().tokenHumanReadablePrecision} 位小数';
      } else {
        error.amount = null;
      }
    } catch (_) {
      error.amount = '请输入有效的金额';
    }
  }

  @action
  void validatePayeeAddress(String value) {
    if (!value.startsWith(globalEnv().didPrefix)) {
      error.payeeAddress = '请输入有效的收款人地址';
      return;
    }

    String address = value.substring(7);
    print(address);

    try {
      EthereumAddress.fromHex(address);
      if (address == payerAddress) {
        error.payeeAddress = '收款人地址不能与付款人地址相同';
      } else {
        error.payeeAddress = null;
      }
    } catch (_) {
      error.payeeAddress = '请输入有效的收款人地址';
    }
  }
}

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String amount;

  @observable
  String payeeAddress;

  @computed
  bool get hasErrors => amount != null || payeeAddress != null;
}
