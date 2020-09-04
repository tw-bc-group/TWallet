import 'package:get/get.dart';
import 'package:json_store/json_store.dart';
import 'package:tw_wallet_ui/models/dcep/dcep.dart';
import 'package:tw_wallet_ui/service/api_provider.dart';
import 'package:tw_wallet_ui/service/contract.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:web3dart/web3dart.dart';

const dcepPrefix = 'dcep';

class DcepStore {
  String owner;
  final RxList<Dcep> items = RxList([]);

  static final JsonStore _db = JsonStore();

  DcepStore() {
    Get.find<IdentityStore>()
        .selectedIdentityStream
        .listen((identity) => _updateOwner(identity.address));

    Get.find<ContractService>().nftTokenContract.eventStream('TransferSingle',
        (results) {
      final EthereumAddress from = results[1] as EthereumAddress;
      final EthereumAddress to = results[2] as EthereumAddress;
      if (from.toString().toLowerCase() == owner ||
          to.toString().toLowerCase() == owner) {
        Get.find<ApiProvider>().fetchTokenV2(owner).then((res) {
          print('res: $res');
          res.ifPresent((list) => items.value = list);
        });
      }
    });
  }

  void _updateOwner(String newOwner) {
    owner = newOwner.toLowerCase();
    _db.getListLike('$dcepPrefix: $owner %').then((list) {
      print('updateOwner: $owner');
      if (null != list) {
        items.value = list.map((item) => Dcep.fromJson(item)).toList();
      }
    });
  }
}
