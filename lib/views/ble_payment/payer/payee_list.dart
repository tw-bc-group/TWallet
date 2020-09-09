import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ble_lib/flutter_ble_lib.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/models/identity/decentralized_identity.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';

import 'hex_painter.dart';
import 'payee.dart';
import 'payment.dart';

class PayeeListView extends ListView {
  PayeeListView(DecentralizedIdentity identity, RxList<Payee> payees, int nonce)
      : super.separated(
            separatorBuilder: (context, index) => Divider(
                  color: Colors.grey[300],
                  height: 0,
                  indent: 0,
                ),
            itemCount: payees.length,
            itemBuilder: (context, i) {
              return _buildRow(context, payees, payees[i], identity, nonce);
            });

  static Widget _buildAvatar(BuildContext context, Payee device) {
    switch (device.category) {
      case DeviceCategory.sensorTag:
        return CircleAvatar(
            backgroundColor: Theme.of(context).accentColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/icons/ti_logo.png'),
            ));
      case DeviceCategory.hex:
        return CircleAvatar(
            backgroundColor: Colors.black,
            child:
                CustomPaint(painter: HexPainter(), size: const Size(20, 24)));
      case DeviceCategory.other:
      default:
        return CircleAvatar(
            backgroundColor: WalletColor.primary,
            foregroundColor: WalletColor.white,
            child: const Icon(Icons.attach_money));
    }
  }

  static Widget _buildRow(
    BuildContext context,
    RxList<Payee> payees,
    Payee payee,
    DecentralizedIdentity identity,
    int nonce,
  ) {
    return ListTile(
      onTap: () async {
        final String payeeName = await Get.to(Payment(payee, identity, nonce));
        payees.removeWhere((payee) => payee.name == payeeName);
      },
      leading: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: _buildAvatar(context, payee),
      ),
      title: Text(payee.name),
      trailing: const Padding(
        padding: EdgeInsets.only(top: 16),
        child: Icon(Icons.chevron_right, color: Colors.grey),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            payee.id.toString(),
            style: const TextStyle(fontSize: 10),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          )
        ],
      ),
      contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
    );
  }
}

class PayeeList extends StatefulWidget {
  final int nonce;
  final DecentralizedIdentity _identity;

  const PayeeList(this._identity, this.nonce);

  @override
  State<StatefulWidget> createState() => _PayeeListState();
}

class _PayeeListState extends State<PayeeList> {
  final BleManager _bleManager = BleManager();
  final RxList<Payee> _bleDevices = RxList([]);
  StreamSubscription<ScanResult> _scanSubscription;

  Future<bool> _checkAndRequirePermissions() async {
    final Permission _permission = Permission.locationWhenInUse;
    final PermissionStatus status = await _permission.status;

    if (!status.isGranted) {
      if (status.isDenied ||
          status.isRestricted ||
          status.isPermanentlyDenied) {
        return showCupertinoDialog(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              content: const Text("需要去应用设置页面允许使用定位信息权限"),
              actions: <Widget>[
                CupertinoDialogAction(
                  onPressed: () async {
                    Navigator.pop(context, false);
                    await openAppSettings();
                  },
                  child: const Text("去设置"),
                ),
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text("拒绝"),
                ),
              ],
            );
          },
        );
      } else {
        await _permission.request();
      }
    }
    return _permission.isGranted;
  }

  Future<void> _waitForBluetoothPoweredOn() async {
    final Completer completer = Completer();

    StreamSubscription<BluetoothState> subscription;

    subscription =
        _bleManager.observeBluetoothState().listen((bluetoothState) async {
      if (bluetoothState == BluetoothState.POWERED_ON &&
          !completer.isCompleted) {
        await subscription.cancel();
        completer.complete();
      }
    });

    return completer.future;
  }

  void _startScan() {
    _scanSubscription =
        _bleManager.startPeripheralScan().listen((ScanResult scanResult) {
      final bleDevice = Payee(scanResult);
      if (scanResult.advertisementData.localName != null &&
          !_bleDevices.contains(bleDevice)) {
        _bleDevices.add(bleDevice);
      }
    });
  }

  Future<void> _refresh() {
    return Future.value(_scanSubscription?.cancel())
        .then((_) => _bleManager.stopPeripheralScan())
        .then((_) => _bleDevices.clear())
        .then((_) => _checkAndRequirePermissions())
        .then((_) => _startScan());
  }

  @override
  void initState() {
    super.initState();
    _bleManager
        .createClient()
        .then((_) => _checkAndRequirePermissions())
        .then((_) => _waitForBluetoothPoweredOn())
        .then((_) => _startScan());
  }

  @override
  void dispose() {
    super.dispose();
    _scanSubscription?.cancel()?.then((_) => _bleManager.destroyClient());
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      title: '附近收款账户',
      bodyBackColor: WalletColor.white,
      child: RefreshIndicator(
        onRefresh: _refresh,
        child: Obx(
            () => PayeeListView(widget._identity, _bleDevices, widget.nonce)),
      ),
    );
  }
}
