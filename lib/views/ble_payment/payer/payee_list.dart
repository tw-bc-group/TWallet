

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ble_lib_ios_15/flutter_ble_lib.dart';
import 'package:flutter_blue/flutter_blue.dart' as flutter_blue;
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/models/identity/decentralized_identity.dart';
import 'package:tw_wallet_ui/views/ble_payment/common/bluetooth_off.dart';
import 'package:tw_wallet_ui/views/ble_payment/payer/hex_painter.dart';
import 'package:tw_wallet_ui/views/ble_payment/payer/payee.dart';
import 'package:tw_wallet_ui/views/ble_payment/payer/payment.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';

class PayeeListView extends ListView {
  PayeeListView(DecentralizedIdentity identity, RxList<Payee> payees)
      : super.separated(
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey[300],
            height: 0,
            indent: 0,
          ),
          itemCount: payees.length,
          itemBuilder: (context, i) {
            return _buildRow(context, payees, payees[i], identity);
          },
        );

  static Widget _buildAvatar(BuildContext context, Payee device) {
    switch (device.category) {
      case DeviceCategory.sensorTag:
        return CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/icons/ti_logo.png'),
          ),
        );
      case DeviceCategory.hex:
        return CircleAvatar(
          backgroundColor: Colors.black,
          child: CustomPaint(painter: HexPainter(), size: const Size(20, 24)),
        );
      case DeviceCategory.other:
      default:
        return CircleAvatar(
          backgroundColor: WalletColor.primary,
          foregroundColor: WalletColor.white,
          child: const Icon(Icons.attach_money),
        );
    }
  }

  static Widget _buildRow(
    BuildContext context,
    RxList<Payee> payees,
    Payee payee,
    DecentralizedIdentity identity,
  ) {
    return ListTile(
      onTap: () => Get.to(Payment(payee, identity)),
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
            payee.id,
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

class PayeeListScreen extends StatefulWidget {
  final DecentralizedIdentity _identity;

  const PayeeListScreen(this._identity);

  @override
  State<StatefulWidget> createState() => _PayeeListScreenState();
}

class _PayeeListScreenState extends State<PayeeListScreen> {
  final BleManager _bleManager = BleManager();
  final RxList<Payee> _bleDevices = RxList([]);
  late StreamSubscription<ScanResult> _scanSubscription;

  Future<bool?> _checkAndRequirePermissions() async {
    const Permission _permission = Permission.locationWhenInUse;
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

    late StreamSubscription<BluetoothState> subscription;

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
    return Future.value(_scanSubscription.cancel())
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
    _scanSubscription.cancel().then((_) => _bleManager.destroyClient());
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      title: '附近收款账户',
      bodyBackColor: WalletColor.white,
      child: RefreshIndicator(
        onRefresh: _refresh,
        child: Obx(() => PayeeListView(widget._identity, _bleDevices)),
      ),
    );
  }
}

class PayeeListPage extends StatelessWidget {
  final DecentralizedIdentity _identity;

  const PayeeListPage(this._identity);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: flutter_blue.FlutterBlue.instance.state,
      builder: (
        BuildContext context,
        AsyncSnapshot<flutter_blue.BluetoothState> snapshot,
      ) {
        if (flutter_blue.BluetoothState.on == snapshot.data) {
          return PayeeListScreen(_identity);
        } else {
          return const BluetoothOffScreen();
        }
      },
    );
  }
}
