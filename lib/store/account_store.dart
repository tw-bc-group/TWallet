import 'package:tw_wallet_ui/models/identity/account_info.dart';
import 'package:web3dart/credentials.dart';

abstract class AccountStore {
  Future<AccountInfo> get accountInfo;
  Credentials get credentials;
}
