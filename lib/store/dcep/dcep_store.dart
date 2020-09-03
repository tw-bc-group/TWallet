import 'package:get/get.dart';
import 'package:json_store/json_store.dart';
import 'package:optional/optional.dart';
import 'package:tw_wallet_ui/models/dcep/dcep.dart';

const dcepStoreName = 'dcep_store';

class DcepStore {
  static final _db = JsonStore(dbName: dcepStoreName);

  final RxList<Dcep> items;

  const DcepStore(this.items);

  static Future<DcepStore> init() async {
    final List<Dcep> items = Optional.ofNullable(await _db.getListLike('%'))
        .map((listItems) => listItems.map((item) {
              return Dcep.fromJson(item);
            }).toList())
        .orElse([]);

    return DcepStore(RxList(items));
  }

  List<Dcep> getItems(String owner) {
    return items.where((item) => item.owner == owner).toList();
  }

  void addOne(Dcep dcep) {
    _db.setItem('$dcep.owner: $dcep.sn', dcep.toJson());
  }

  void deleteOne(String owner, String sn) {
    _db.deleteItem('$owner: $sn');
  }
}
