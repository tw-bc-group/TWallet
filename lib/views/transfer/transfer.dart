import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/models/did.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/env_store.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/views/transfer/transfer_store.dart';
import 'package:tw_wallet_ui/views/transfer/widgets/transfer_input.dart';
import 'package:tw_wallet_ui/widgets/hint_dialog.dart';
import 'package:tw_wallet_ui/widgets/layouts/new_common_layout.dart';

class TransferPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TransferPageState();
}

class TransferPageState extends State<TransferPage> {
  final TransferStore _transferStore = TransferStore();
  final IdentityStore iStore = getIt<IdentityStore>();
  TextEditingController _payeeAddressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _transferStore.setupErrorReseters();
    var identity = getIt<IdentityStore>().selectedIdentity.value;
    _transferStore.updateBalance(identity.balance.humanReadable);
    _transferStore.updatePayerAddress(identity.address);
  }

  @override
  void dispose() {
    _transferStore.dispose();
    super.dispose();
  }

  void confirmTransferPage() {
    _transferStore.validateAll();
    if (!_transferStore.error.hasErrors) {
      Application.router.navigateTo(context,
          '${Routes.transferConfirm}?currency=${Uri.encodeQueryComponent(globalEnv().tokenName)}&amount=${_transferStore.amount}&toAddress=${_transferStore.payeeAddress}');
    }
  }

  bool btnDisabled() {
    return _transferStore.amount == null || _transferStore.payeeAddress == null;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => NewCommonLayout(
        withBottomBtn: true,
        btnText: '下一步',
        btnOnPressed: btnDisabled() ? null : confirmTransferPage,
        title: 'DC/EP',
        child: Observer(
          builder: (context) => Column(
            children: <Widget>[
              buildHeader(),
              buildBody(),
            ],
          )
        ),
      )
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
                '接收地址',
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
                          .updatePayeeAddress(did.eip55Address);
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
