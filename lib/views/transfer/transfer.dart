import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tw_wallet_ui/global/common/application.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/global/common/theme.dart';
import 'package:tw_wallet_ui/global/store/identity_store.dart';
import 'package:tw_wallet_ui/global/widgets/layouts/common_layout.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/views/transfer/transfer_store.dart';
import 'package:tw_wallet_ui/views/transfer/widgets/transfer_row_label.dart';

const AMOUNT_ERROR = '金额不正确';
const ADDRESS_IS_NOT_VALID = '账户地址不正确';

class TransferPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TransferPageState();
}

class TransferPageState extends State<TransferPage> {
  final TransferStore _transferStore = TransferStore();

  @override
  void initState() {
    super.initState();
    _transferStore.setupValidators();
    var identity = getIt<IdentityStore>().selectedIdentity.value;
    _transferStore.updateBalance(identity.balance.humanReadable);
    _transferStore.updatePayerAddress(identity.address);
    _transferStore.validateAll();
  }

  @override
  void dispose() {
    _transferStore.dispose();
    super.dispose();
  }

  void confirmTransferPage() {
    Application.router.navigateTo(context,
        '${Routes.transferConfirm}?currency=TWPOINTS&amount=${_transferStore.amount}&toAddress=${_transferStore.payeeAddress}');
  }

  @override
  Widget build(BuildContext context) => Observer(builder: (_) {
        return CommonLayout(
            withBottomBtn: true,
            btnText: '下一步',
            btnOnPressed:
                _transferStore.error.hasErrors ? null : confirmTransferPage,
            title: '转账给其他人',
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              TransferRowWidget(
                title: '当前余额',
                child: Text(
                  _transferStore.balance,
                  style: TextStyle(
                      fontSize: 16, color: WalletTheme.rgbColor('#888888')),
                ),
              ),
              TransferRowWidget(
                  title: '金额',
                  errorMsg: _transferStore.error.amount,
                  child: SizedBox(
                      width: 230,
                      child: TextField(
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter(RegExp(r'\d+|\.')),
                        ],
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(style: BorderStyle.none),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(style: BorderStyle.none),
                          ),
                        ),
                        style: TextStyle(
                            fontSize: 16,
                            color: WalletTheme.rgbColor('#888888')),
                        onChanged: (value) => _transferStore.amount = value,
                      ))),
              TransferRowWidget(
                  title: '接收地址',
                  errorMsg: _transferStore.error.payeeAddress,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 230,
                        height: 50,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          maxLines: 3,
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter(
                                RegExp(r'[a-zA-Z0-9]+')),
                          ],
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(style: BorderStyle.none),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(style: BorderStyle.none),
                            ),
                            contentPadding: EdgeInsets.all(8.0),
                          ),
                          style: TextStyle(
                              fontSize: 16,
                              color: WalletTheme.rgbColor('#888888')),
                          onChanged: (value) =>
                              _transferStore.payeeAddress = value,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Icon(Icons.person),
                          ),
                          Icon(Icons.crop_free)
                        ],
                      )
                    ],
                  )),
            ])));
      });
}
