import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/models/amount.dart';
import 'package:tw_wallet_ui/models/did.dart';
import 'package:tw_wallet_ui/models/identity/decentralized_identity.dart';
import 'package:tw_wallet_ui/models/tx_status.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/views/transfer/transfer_store.dart';
import 'package:tw_wallet_ui/views/transfer/widgets/transfer_input.dart';
import 'package:tw_wallet_ui/views/transfer_confirm/widgets/input_pin.dart';
import 'package:tw_wallet_ui/views/tx_list/tx_list_details_page.dart';
import 'package:tw_wallet_ui/views/tx_list/utils/date.dart';
import 'package:tw_wallet_ui/widgets/hint_dialog.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';

class TransferPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TransferPageState();
}

class TransferPageState extends State<TransferPage> {
  final GlobalKey<InputPinWidgetState> inputPinWidgetKey =
      GlobalKey<InputPinWidgetState>();
  final TransferStore _transferStore = TransferStore();
  final IdentityStore iStore = Get.find();
  final TextEditingController _payeeAddressController = TextEditingController();
  YYDialog? confirmDialogInstance;
  late DecentralizedIdentity identity;

  @override
  void initState() {
    super.initState();
    _transferStore.setupErrorDisposers();
    identity = Get.find<IdentityStore>().selectedIdentity!.value;
    _transferStore.payerDID = identity.did.toString();
    _transferStore.balance = identity.accountInfo.balance?.humanReadable;
  }

  @override
  void dispose() {
    _transferStore.dispose();
    super.dispose();
  }

  void onNext() {
    _transferStore.validateAll();
    if (!_transferStore.error.hasErrors) {
      showConfirmDialog();
    }
  }

  void showConfirmDialog() {
    confirmDialogInstance = YYDialog().build(Get.overlayContext)
      ..backgroundColor = WalletColor.white
      ..borderRadius = 12.0
      ..width = 1000.0
      ..margin = const EdgeInsets.symmetric(horizontal: 24)
      ..widget(
        Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                '请核对转账信息',
                style: WalletFont.font_14(
                  textStyle: const TextStyle(fontWeight: FontWeight.w600),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: WalletColor.lightGrey,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '金额',
                      style: WalletFont.font_14(
                        textStyle: TextStyle(color: WalletColor.grey),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '￥${_transferStore.amount}',
                      style: WalletFont.font_16(),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '接收账户',
                      style: WalletFont.font_14(
                        textStyle: TextStyle(color: WalletColor.grey),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(top: 8),
                    child: Text(
                      _transferStore.payeeDID!,
                      style: WalletFont.font_16(),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20, top: 32),
              child: Text(
                '输入PIN码',
                style: WalletFont.font_16(),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InputPinWidget(key: inputPinWidgetKey),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 34),
                    child: WalletTheme.button(text: '确定', onPressed: onConfirm),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    child: WalletTheme.button(
                      text: '取消',
                      onPressed: () {
                        confirmDialogInstance!.dismiss();
                        confirmDialogInstance = null;
                      },
                      buttonType: ButtonType.outlineType,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
      ..animatedFunc = (child, animation) {
        return FadeTransition(
          opacity: Tween(begin: 0.0, end: 1.0).animate(animation),
          child: child,
        );
      }
      ..show();
  }

  Future<Object?> onConfirm() async {
    final bool pinValidation =
        await inputPinWidgetKey.currentState!.validatePin();
    final String payeeAddress = '0x${_transferStore.payeeDID!.substring(7)}';
    final String amount = _transferStore.amount!;
    if (pinValidation) {
      final bool transferSuccess =
          await iStore.selectedIdentity!.value.transferPoint(
        toAddress: payeeAddress,
        amount: Amount(Decimal.parse(amount.toString())),
      );
      if (transferSuccess) {
        return Navigator.pushNamed(
          context,
          Routes.txListDetails,
          arguments: TxListDetailsPageArgs(
            amount: amount,
            time: parseDateTime(DateTime.now()),
            status: TxStatus.transferring,
            fromAddress: iStore.selectedIdentity!.value.address,
            toAddress: payeeAddress,
            fromAddressName: iStore.selectedIdentityName,
            isExpense: true,
            shouldBackToHome: true,
          ),
        );
      }
    }
    return null;
  }

  bool btnDisabled() {
    return _transferStore.amount == null ||
        _transferStore.amount!.isEmpty ||
        _transferStore.payeeDID == null ||
        _transferStore.payeeDID!.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => CommonLayout(
        withBottomBtn: true,
        btnText: '下一步',
        btnOnPressed: btnDisabled() ? null : onNext,
        title: 'DC/EP',
        child: Column(
          children: <Widget>[
            buildHeader(),
            buildBody(),
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      margin: const EdgeInsets.only(top: 34),
      alignment: Alignment.center,
      child: Text(
        iStore.selectedIdentityBalance!.humanReadableWithSymbol,
        style:
            WalletFont.font_24(textStyle: TextStyle(color: WalletColor.white)),
      ),
    );
  }

  Widget buildBody() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 34),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          color: WalletColor.white,
        ),
        child: ListView(
          children: <Widget>[
            Text(
              '金额',
              style: WalletFont.font_14(
                textStyle: const TextStyle(fontWeight: FontWeight.w600),
              ),
              textAlign: TextAlign.left,
            ),
            TransferInputWidget(
              errorText: _transferStore.error.amount,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'\d+|\.'))
              ],
              onChange: (value) => _transferStore.amount = value,
            ),
            Container(
              margin: const EdgeInsets.only(top: 40, bottom: 16),
              child: Text(
                '接收账户',
                style: WalletFont.font_14(
                  textStyle: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                buildFunctionButton(
                  active: false,
                  iconAsset: 'assets/icons/address.svg',
                  title: '地址簿',
                  margin: const EdgeInsets.only(right: 20),
                ),
                buildFunctionButton(
                  iconAsset: 'assets/icons/scan.svg',
                  title: '扫码识别',
                  onTap: () async {
                    final String scanResult = await Application.router
                        .navigateTo(context, Routes.qrScanner) as String;

                    if (null == scanResult) {
                      return;
                    }

                    try {
                      final DID did = DID.parse(scanResult);
                      _payeeAddressController.text = did.toString();
                      _transferStore.payeeDID = did.toString();
                    } catch (_) {
                      await hintDialogHelper(
                        context,
                        DialogType.warning,
                        '未识别到有效的身份信息',
                      );
                    }
                  },
                )
              ],
            ),
            TransferInputWidget(
              withPrefix: false,
              errorText: _transferStore.error.payeeDID,
              keyboardType: TextInputType.text,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9\:]+'))
              ],
              controller: _payeeAddressController,
              onChange: (value) => _transferStore.payeeDID = value,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFunctionButton(
      {bool active = true,
      required String iconAsset,
      required String title,
      EdgeInsetsGeometry? margin,
      VoidCallback? onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: margin,
          padding: const EdgeInsets.symmetric(vertical: 11),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: active ? WalletColor.primary : WalletColor.middleGrey,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(right: 8),
                child: SvgPicture.asset(iconAsset, color: WalletColor.white),
              ),
              Text(
                title,
                style: WalletFont.font_16(
                  textStyle: TextStyle(color: WalletColor.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
