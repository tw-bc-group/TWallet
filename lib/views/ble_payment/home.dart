import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/models/dcep/dcep.dart';
import 'package:tw_wallet_ui/models/identity/decentralized_identity.dart';
import 'package:tw_wallet_ui/service/contract.dart';
import 'package:tw_wallet_ui/store/dcep/dcep_store.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
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
  final Connectivity _connectivity = Connectivity();
  final Rx<DcepType> _redeemType = Rx(DcepType.rmb100);
  final DcepStore _dcepStore = Get.find<DcepStore>();

  @override
  void initState() {
    super.initState();
  }

  Widget _buildAddIdentityCard(BuildContext context, HomeStore homeStore) {
    final ScreenUtil _screenUtil = ScreenUtil();

    return Container(
      margin: EdgeInsets.only(
          left: _screenUtil.setWidth(24).toDouble(),
          right: _screenUtil.setWidth(24).toDouble(),
          top: _screenUtil.setHeight(10).toDouble(),
          bottom: _screenUtil.setHeight(147).toDouble()),
      padding: EdgeInsets.only(
          left: _screenUtil.setWidth(20).toDouble(),
          right: _screenUtil.setWidth(20).toDouble(),
          top: _screenUtil.setHeight(90).toDouble(),
          bottom: _screenUtil.setHeight(46).toDouble()),
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
              Text("您还没有添加身份",
                  style: TextStyle(
                    color: Color(0xff111111),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0,
                  )),
              Text("请前往“身份”页面添加身份。",
                  style: TextStyle(
                    color: Color(0xff111111),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0,
                  )),
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
            boxShadow: [BoxShadow(color: WalletColor.grey, blurRadius: 12)]),
        child: Center(child: Text(description)),
      ),
    );
  }

  Widget _buildNetworkOffScreen(ConnectivityResult result) {
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
            '网络已关闭，请打开网络同步 nonce',
            style: Theme.of(context)
                .primaryTextTheme
                .subtitle1
                .copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildMainScreen(DecentralizedIdentity identity) {
    return Container(
      color: WalletColor.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Obx(() => DropdownButton(
                  value: _redeemType.value,
                  items: DcepType.values
                      .map((type) => DropdownMenuItem(
                          value: type, child: Text(type.humanReadable)))
                      .toList(),
                  onChanged: (DcepType value) {
                    _redeemType.value = value;
                  },
                )),
            WalletTheme.button(
                text: '兑换',
                height: 28,
                onPressed: () => identity
                    .redeemDcep(_redeemType.value)
                    .then((_) => showDialogSimple(DialogType.success, '兑换成功'))),
          ]),
          Expanded(
            child: Obx(() => Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RefreshIndicator(
                    onRefresh: () => _dcepStore.refresh(),
                    child: ListView(
                      children: _dcepStore.sortedItems
                          .map((item) => _dcepListItem(item.type.humanReadable))
                          .toList(),
                    ),
                  ),
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: WalletTheme.button(
                      text: '收款',
                      onPressed: () => Get.to(PayeeConfirm(identity)))),
              Container(width: 20),
              Expanded(
                  child: WalletTheme.button(
                      text: '付款',
                      onPressed: () => Get.to(PayeeList(identity)))),
            ],
          )
        ]),
      ),
    );
  }

  Widget _buildScreen() {
    if (Get.find<IdentityStore>().selectedIdentity.isPresent) {
      final DecentralizedIdentity identity =
          Get.find<IdentityStore>().selectedIdentity.value;

      return FutureBuilder(
          initialData: null,
          future: _connectivity.checkConnectivity(),
          builder: (BuildContext context,
              AsyncSnapshot<ConnectivityResult> snapshot) {
            if (null != snapshot.data) {
              return StreamBuilder(
                stream: _connectivity.onConnectivityChanged,
                initialData: snapshot.data,
                builder: (BuildContext context,
                    AsyncSnapshot<ConnectivityResult> snapshot) {
                  if (snapshot.data == ConnectivityResult.none) {
                    return _buildNetworkOffScreen(snapshot.data);
                  } else {
                    return FutureBuilder(
                      initialData: null,
                      future: Get.find<ContractService>()
                          .nftTokenContract
                          .getTransactionCount(
                              EthereumAddress.fromHex(identity.address)),
                      builder:
                          (BuildContext context, AsyncSnapshot<int> snapshot) {
                        if (null != snapshot.data) {
                          _dcepStore.nonce = snapshot.data;
                          return _buildMainScreen(identity);
                        } else {
                          return Container();
                        }
                      },
                    );
                  }
                },
              );
            } else {
              return Container();
            }
          });
    } else {
      return _buildAddIdentityCard(context, widget.homeStore);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(title: '离线支付演示', child: _buildScreen());
  }
}
