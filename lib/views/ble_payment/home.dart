import 'dart:collection';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/models/dcep/dcep.dart';
import 'package:tw_wallet_ui/models/identity/decentralized_identity.dart';
import 'package:tw_wallet_ui/models/offline_tx/offline_tx.dart';
import 'package:tw_wallet_ui/service/contract.dart';
import 'package:tw_wallet_ui/store/dcep/dcep_store.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/views/ble_payment/common/tx_store.dart';
import 'package:tw_wallet_ui/views/ble_payment/payee/payee_confirm.dart';
import 'package:tw_wallet_ui/views/ble_payment/payer/payee_list.dart';
import 'package:tw_wallet_ui/views/home/home.dart';
import 'package:tw_wallet_ui/views/home/home_store.dart';
import 'package:tw_wallet_ui/widgets/hint_dialog.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';
import 'package:web3dart/web3dart.dart';

class BlePaymentHome extends StatefulWidget {
  final HomeStore homeStore;

  const BlePaymentHome(this.homeStore);

  @override
  State<StatefulWidget> createState() => _BlePaymentHomeState();
}

class _BlePaymentHomeState extends State<BlePaymentHome> {
  bool isNonceSynced = false;

  final Connectivity _connectivity = Connectivity();
  final Rx<DcepType?> _redeemType = Rx(DcepType.rmb100);
  final DcepStore _dcepStore = Get.find<DcepStore>();
  final OfflineTxStore _txStore = Get.find<OfflineTxStore>();

  @override
  void initState() {
    super.initState();
  }

  Widget _buildAddIdentityCard(BuildContext context, HomeStore homeStore) {
    final ScreenUtil screenUtil = ScreenUtil();

    return Container(
      margin: EdgeInsets.only(
        left: screenUtil.setWidth(24),
        right: screenUtil.setWidth(24),
        top: screenUtil.setHeight(10),
        bottom: screenUtil.setHeight(147),
      ),
      padding: EdgeInsets.only(
        left: screenUtil.setWidth(20),
        right: screenUtil.setWidth(20),
        top: screenUtil.setHeight(90),
        bottom: screenUtil.setHeight(46),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SvgPicture.asset(
            'assets/icons/new-identity.svg',
          ),
          Column(
            children: const <Widget>[
              Text(
                "您还没有添加身份",
                style: TextStyle(
                  color: Color(0xff111111),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0,
                ),
              ),
              Text(
                "请前往“身份”页面添加身份。",
                style: TextStyle(
                  color: Color(0xff111111),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0,
                ),
              ),
            ],
          ),
          WalletTheme.button(
            text: '立即前往',
            height: 44,
            onPressed: () {
              Navigator.pop(context);
              homeStore.currentPage = HomeState.identityIndex;
            },
          ),
        ],
      ),
    );
  }

  Widget _dcepListItem(String description) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: WalletColor.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: WalletColor.grey, blurRadius: 12)],
        ),
        child: Center(child: Text(description)),
      ),
    );
  }

  Widget _buildNetworkOffScreen(ConnectivityResult? result) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Icon(
            Icons.network_check,
            size: 200.0,
            color: Colors.white54,
          ),
          Text(
            '网络已关闭，请打开网络同步账户信息',
            style: Theme.of(context)
                .primaryTextTheme
                .subtitle1
                ?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }

  List<Widget> _dcepListItems(List<Dcep> dcepList, Queue<TxReceive?> txList) {
    final items = dcepList.map((item) => item.type.humanReadable).toList()
      ..addAll(txList.map((tx) => '${tx!.description}(冻结，待确权)').toList());
    return items.map((item) => _dcepListItem(item)).toList();
  }

  Widget _buildMainScreen(DecentralizedIdentity identity) {
    return ColoredBox(
      color: WalletColor.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => DropdownButton(
                    value: _redeemType.value,
                    items: DcepType.values
                        .map(
                          (type) => DropdownMenuItem(
                            value: type,
                            child: Text(type.humanReadable),
                          ),
                        )
                        .toList(),
                    onChanged: (DcepType? value) {
                      if (value != null) _redeemType.value = value;
                    },
                  ),
                ),
                WalletTheme.button(
                  text: '兑换',
                  height: 28,
                  onPressed: () => identity.redeemDcep(_redeemType.value!).then(
                        (_) => showDialogSimple(DialogType.success, '兑换成功'),
                      ),
                ),
              ],
            ),
            Expanded(
              child: Obx(
                () => Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RefreshIndicator(
                    onRefresh: () => _dcepStore.refresh(),
                    child: ListView(
                      children: _dcepListItems(
                        _dcepStore.sortedItems,
                        _txStore.txQueue.value,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: WalletTheme.button(
                    text: '收款',
                    onPressed: () => Get.to(PayeeConfirm(identity)),
                  ),
                ),
                Container(width: 20),
                Expanded(
                  child: WalletTheme.button(
                    text: '付款',
                    onPressed: () => Get.to(PayeeListPage(identity)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildScreen() {
    if (Get.find<IdentityStore>().selectedIdentity != null) {
      final DecentralizedIdentity identity =
          Get.find<IdentityStore>().selectedIdentity!;

      return FutureBuilder<ConnectivityResult>(
        future: _connectivity.checkConnectivity(),
        builder: (
          BuildContext context,
          AsyncSnapshot<ConnectivityResult?> snapshot,
        ) {
          if (null == snapshot.data) {
            return Container();
          } else {
            return StreamBuilder(
              initialData: snapshot.data,
              stream: _connectivity.onConnectivityChanged,
              builder: (
                BuildContext context,
                AsyncSnapshot<ConnectivityResult> snapshot,
              ) {
                if (!isNonceSynced &&
                    ConnectivityResult.none == snapshot.data) {
                  return _buildNetworkOffScreen(snapshot.data);
                } else if (!isNonceSynced &&
                    ConnectivityResult.none != snapshot.data) {
                  return FutureBuilder<int>(
                    future: Get.find<ContractService>()
                        .nftTokenContract
                        ?.getTransactionCount(
                          EthereumAddress.fromHex(identity.address),
                        ),
                    builder:
                        (BuildContext context, AsyncSnapshot<int?> snapshot) {
                      if (null != snapshot.data) {
                        isNonceSynced = true;
                        _dcepStore.nonce = snapshot.data!;
                        return _buildMainScreen(identity);
                      } else {
                        return Container();
                      }
                    },
                  );
                } else {
                  return _buildMainScreen(identity);
                }
              },
            );
          }
        },
      );
    } else {
      return _buildAddIdentityCard(context, widget.homeStore);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      title: '离线支付',
      bottomBackColor: WalletColor.white,
      child: _buildScreen(),
    );
  }
}
