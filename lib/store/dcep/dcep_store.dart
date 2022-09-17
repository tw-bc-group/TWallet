import 'package:get/get.dart';
import 'package:tw_wallet_ui/models/dcep/dcep.dart';
import 'package:tw_wallet_ui/service/api_provider.dart';
import 'package:tw_wallet_ui/service/contract.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:web3dart/web3dart.dart';

const dcepPrefix = 'dcep';

class DcepStore {
  final Rx<int> rxNonce = Rx(0);
  final RxList<Dcep> _items = RxList([]);

  String? owner;

  int get nonce => rxNonce.value;

  List<Dcep> get sortedItems =>
      (_items..sort((a, b) => b.compareTo(a))).toList();

  set nonce(int newNonce) => rxNonce.value = newNonce;

  Future<void> refresh() {
    if (null != owner) {
      Get.find<ApiProvider>().fetchDcepV2(owner!).then((list) {
        _items.assignAll(list..sort((a, b) => b.compareTo(a)));
      });
    }

    return Future.value();
  }

  DcepStore() {
    Get.find<IdentityStore>()
        .selectedIdentityStream!
        .listen((identity) => _updateOwner(identity.address));

    Get.find<ContractService>().nftTokenContract!.eventStream('TransferSingle',
        (results) {
      if (null != owner) {
        final EthereumAddress from = results[1] as EthereumAddress;
        final EthereumAddress to = results[2] as EthereumAddress;
        if (from.toString().toLowerCase() == owner ||
            to.toString().toLowerCase() == owner) {
          Future.delayed(const Duration(seconds: 2)).then((_) => refresh());
        }
      }
    });
  }

  void add(Dcep dcep) {
    _items.add(dcep);
  }

  void remove(Dcep dcep) {
    _items.remove(dcep);
  }

  void clear() {
    _items.clear();
    owner = null;
  }

  void _updateOwner(String newOwner) {
    owner = newOwner.toLowerCase();
    refresh();
  }
}
