import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tw_wallet_ui/global/common/application.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/global/common/theme.dart';
import 'package:tw_wallet_ui/global/store/identity_store.dart';
import 'package:tw_wallet_ui/global/widgets/layouts/common_layout.dart';
import 'package:tw_wallet_ui/models/address.dart';
import 'package:tw_wallet_ui/models/identity.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/views/transfer/widgets/transfer_row_label.dart';

const AMOUNT_ERROR = '金额不正确';
const ADDRESS_IS_NOT_VALID = '账户地址不正确';

class TransferPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransferPageState();
  }
}

class TransferPageState extends State<TransferPage> {
  final IdentityStore identityStore = getIt<IdentityStore>();
  Identity identity;
  double balance = 0;
  double transferAmount;
  String transferToAddress;
  String amountErrMsg;
  String addressErrMsg;

  @override
  void initState() {
    super.initState();
    identity = identityStore.selectedIdentity.value;
    balance = identity.balance.value.toDouble();
  }

  void handleAmountChange(String value) {
    setState(() {
      transferAmount = double.parse(value);
      if (amountErrMsg != null) {
        amountErrMsg = null;
      }
    });
  }

  void handleAddressChange(String value) {
    setState(() {
      transferToAddress = value;
      if (addressErrMsg != null) {
        addressErrMsg = null;
      }
    });
  }

  bool validateFields() {
    var amountValid = transferAmount != null &&
        transferAmount <= balance &&
        transferAmount > 0;
    var addressValid =
        transferToAddress != null && Address.validateFormat(transferToAddress);
    setState(() {
      if (!amountValid) {
        amountErrMsg = AMOUNT_ERROR;
      }
      if (!addressValid) {
        addressErrMsg = ADDRESS_IS_NOT_VALID;
      }
    });
    return amountValid && addressValid;
  }

  void onNext() {
    if (validateFields()) {
      Application.router.navigateTo(context,
          '${Routes.transferConfirm}?currency=TWPOINTS&amount=$transferAmount&toAddress=$transferToAddress');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
        withBottomBtn: true,
        btnText: '下一步',
        btnOnPressed: onNext,
        title: '转账给其他人',
        child: SingleChildScrollView(
            child: Column(children: <Widget>[
          TransferRowWidget(
            title: '当前余额',
            child: Text(
              balance.toStringAsFixed(2),
              style: TextStyle(
                  fontSize: 16, color: WalletTheme.rgbColor('#888888')),
            ),
          ),
          TransferRowWidget(
              title: '金额',
              errorMsg: amountErrMsg,
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
                        fontSize: 16, color: WalletTheme.rgbColor('#888888')),
                    onChanged: handleAmountChange,
                  ))),
          TransferRowWidget(
              title: '接收地址',
              errorMsg: addressErrMsg,
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
                        WhitelistingTextInputFormatter(RegExp(r'[a-zA-Z0-9]+')),
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
                          fontSize: 16, color: WalletTheme.rgbColor('#888888')),
                      onChanged: handleAddressChange,
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
  }
}
