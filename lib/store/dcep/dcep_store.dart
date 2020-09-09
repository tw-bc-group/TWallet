import 'package:get/get.dart';
import 'package:tw_wallet_ui/models/dcep/dcep.dart';
import 'package:tw_wallet_ui/service/api_provider.dart';
import 'package:tw_wallet_ui/service/contract.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:web3dart/web3dart.dart';

const dcepPrefix = 'dcep';

class DcepStore {
  String owner;
  final RxInt rxNonce = 0.obs;
  final RxList<Dcep> items = RxList([]);

  int get nonce => rxNonce.value;

  set nonce(int newNonce) => rxNonce.value = newNonce;

  Future<void> refresh() {
    if (null != owner) {
      Get.find<ApiProvider>().fetchTokenV2(owner).then((res) {
        res.ifPresent((list) {
          items.value = list;
        });
      });
    }

    return Future.value();
  }

  DcepStore() {
    Get.find<IdentityStore>()
        .selectedIdentityStream
        .listen((identity) => _updateOwner(identity.address));

    Get.find<ContractService>().nftTokenContract.eventStream('TransferSingle',
        (results) {
      if (null != owner) {
        final EthereumAddress from = results[1] as EthereumAddress;
        final EthereumAddress to = results[2] as EthereumAddress;
        if (from.toString().toLowerCase() == owner ||
            to.toString().toLowerCase() == owner) {
          refresh();
        }
      }
    });
  }

  void clear() {
    items.clear();
    owner = null;
  }

  void _updateOwner(String newOwner) {
    owner = newOwner.toLowerCase();
    refresh();
  }
}
