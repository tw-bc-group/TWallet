import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/models/amount.dart';
import 'package:tw_wallet_ui/models/did.dart';
import 'package:tw_wallet_ui/models/identity.dart';
import 'package:tw_wallet_ui/models/tx_status.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/service/dialog.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/views/transfer/transfer_store.dart';
import 'package:tw_wallet_ui/views/transfer/widgets/transfer_input.dart';
import 'package:tw_wallet_ui/views/transfer_confirm/widgets/input_pin.dart';
import 'package:tw_wallet_ui/views/tx_list/tx_list_details_page.dart';
import 'package:tw_wallet_ui/views/tx_list/utils/date.dart';
import 'package:tw_wallet_ui/widgets/hint_dialog.dart';
import 'package:tw_wallet_ui/widgets/layouts/new_common_layout.dart';

class TransferPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TransferPageState();
}

class TransferPageState extends State<TransferPage> {
  final inputPinWidgetKey = GlobalKey<InputPinWidgetState>();
  final TransferStore _transferStore = TransferStore();
  final IdentityStore iStore = getIt<IdentityStore>();
  TextEditingController _payeeAddressController = TextEditingController();
  YYDialog confirmDialogInstance;
  Identity identity;

  @override
  void initState() {
    super.initState();
    _transferStore.setupErrorReseters();
    identity = getIt<IdentityStore>().selectedIdentity.value;
    _transferStore.updateBalance(identity.balance.humanReadable);
    _transferStore.updatePayerAddress(identity.address);
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

  showConfirmDialog() {
    confirmDialogInstance = YYDialog().build()
      ..backgroundColor = WalletColor.white
      ..borderRadius = 12.0
      ..width = FULL_SCREEN_WIDTH
      ..margin = EdgeInsets.symmetric(horizontal: 24)
      ..widget(Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              '请核对转账信息',
              style: WalletFont.font_14(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600
                )
              ),
              textAlign: TextAlign.center,
            )
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: WalletColor.lightGrey,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '金额',
                    style: WalletFont.font_14(
                      textStyle: TextStyle(
                        color: WalletColor.grey
                      )
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  alignment: Alignment.centerLeft,
                  child: Text('￥${_transferStore.amount}', style: WalletFont.font_16()),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '接收账户',
                    style: WalletFont.font_14(
                      textStyle: TextStyle(
                        color: WalletColor.grey
                      )
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 8),
                  child: Text(identity.did.toString(), style: WalletFont.font_16()),
                )
              ],
            ),
          ),
          InputPinWidget(key: inputPinWidgetKey),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 34),
                  child: WalletTheme.button(
                    text: '确定',
                    onPressed: onConfirm
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: WalletTheme.button(
                    text: '取消',
                    onPressed: () {
                      confirmDialogInstance.dismiss();
                      confirmDialogInstance = null;
                    },
                    buttonType: ButtonType.OUTLINE,
                  ),
                )
              ],
            )
          )
        ], 
      ))
      ..animatedFunc = (child, animation) {
        return FadeTransition(
          child: child,
          opacity: Tween(begin: 0.0, end: 1.0).animate(animation),
        );
      }
      ..show();
  }

  onConfirm() async {
    var pinValidation = await inputPinWidgetKey.currentState.validatePin();
    var payeeAddress = '0x${_transferStore.payeeAddress.substring(7)}';
    var amount = _transferStore.amount;
    if (pinValidation) {
      var transferSuccess = await iStore.selectedIdentity.value
          .transferPoint(
              toAddress: payeeAddress,
              amount: Amount(Decimal.parse(amount.toString())));
      if (transferSuccess) {
        Navigator.pushNamed(context, Routes.txListDetails,
            arguments: TxListDetailsPageArgs(
                amount: '-$amount',
                time: parseDate(DateTime.now()),
                status: TxStatus.transferring,
                fromAddress: iStore.selectedIdentity.value.address,
                toAddress: payeeAddress,
                fromAddressName: iStore.myName,
                isExpense: true,
                onPressed: () {
                  iStore.fetchLatestPoint();
                  Navigator.popUntil(context, ModalRoute.withName(Routes.home));
                },
                shouldBackToHome: true));
      }
    }
  }

  bool btnDisabled() {
    return _transferStore.amount == null
      || _transferStore.amount.isEmpty
      || _transferStore.payeeAddress == null
      || _transferStore.payeeAddress.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => NewCommonLayout(
        withBottomBtn: true,
        btnText: '下一步',
        btnOnPressed: btnDisabled() ? null : onNext,
        title: 'DC/EP',
        child: Column(
          children: <Widget>[
            buildHeader(),
            buildBody(),
          ],
        )
      ),
    );
  }
  
  Widget buildHeader() {
    return Container(
      margin: EdgeInsets.only(top: 34),
      alignment: Alignment.center,
      child: Text(
        '${iStore.myBalance.humanReadableWithSymbol}',
        style: WalletFont.font_24(
          textStyle: TextStyle(
            color: WalletColor.white
          )
        ),
      ),
    );
  }

  Widget buildBody() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 34),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12)),
          color: WalletColor.white
        ),
        child: ListView(
          children: <Widget>[
            Text(
              '金额',
              style: WalletFont.font_14(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600
                )
              ),
              textAlign: TextAlign.left,
            ),
            TransferInputWidget(
              errorText: _transferStore.error.amount,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter(RegExp(r'\d+|\.')),
              ],
              onChange: (value) => _transferStore.amount = value
            ),
            Container(
              margin: EdgeInsets.only(top: 40, bottom: 16),
              child: Text(
                '接收账户',
                style: WalletFont.font_14(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w600
                  )
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
                  margin: EdgeInsets.only(right: 20),
                ),
                buildFunctionButton(
                  iconAsset: 'assets/icons/scan.svg',
                  title: '扫码识别',
                  onTap: () async {
                    String scanResult = await Application.router.navigateTo(context, Routes.qrScanner);

                    if (null == scanResult) {
                      return;
                    }

                    try {
                      DID did = DID.parse(scanResult);
                      _transferStore
                          .updatePayeeAddress(did.toString());
                    } catch (_) {
                      await hintDialogHelper(context,
                          DialogType.warning, '未识别到有效的身份信息');
                    }
                  }
                )
              ],
            ),
            TransferInputWidget(
              withPrefix: false,
              errorText: _transferStore.error.payeeAddress,
              keyboardType: TextInputType.text,
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter(
                    RegExp(r'[a-zA-Z0-9\:]+')),
              ],
              controller: _payeeAddressController..text = _transferStore.payeeAddress,
              onChange: (value) => _transferStore.payeeAddress = value,
            ),
          ],
        )
      ),
    );
  }

  Widget buildFunctionButton({
    bool active = true,
    String iconAsset,
    String title,
    EdgeInsetsGeometry margin,
    Function onTap
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: margin,
          padding: EdgeInsets.symmetric(vertical: 11),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: active ? WalletColor.primary : WalletColor.middleGrey,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 8),
                child: SvgPicture.asset(
                  iconAsset,
                  color: WalletColor.white
                ),
              ),
              Text(
                title,
                style: WalletFont.font_16(
                  textStyle: TextStyle(
                    color: WalletColor.white
                  )
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
