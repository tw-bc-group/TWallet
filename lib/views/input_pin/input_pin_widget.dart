import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/device_info.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/generated/l10n.dart';
import 'package:tw_wallet_ui/router/routers.dart';

import 'package:tw_wallet_ui/views/input_pin/input_pin_store.dart';

class PinInputWidget extends StatelessWidget {
  final _inputPin = InputPinStore();

  final TextEditingController textEditingController1;
  final TextEditingController textEditingController2;

  PinInputWidget(this.textEditingController1, this.textEditingController2);

  Widget _inputPinField(
    TextEditingController textEditingController,
    ValueChanged<String> onChanged,
  ) {
    return PinCodeTextField(
      showCursor: false,
      appContext: Get.context!,
      pinTheme: PinTheme(
        activeColor: WalletColor.black,
        inactiveColor: WalletColor.black,
        shape: PinCodeFieldShape.box,
        selectedFillColor: WalletColor.primary,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 40,
        fieldWidth: 40,
        inactiveFillColor: Colors.white,
        activeFillColor: Colors.white,
        borderWidth: 1,
      ),
      length: 6,
      obscureText: true,
      animationType: AnimationType.fade,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      controller: textEditingController,
      onChanged: onChanged,
    );
  }

  VoidCallback _setKey(BuildContext context) {
    return () async {
      // resolved issue - use_build_context_synchronously
      // https://stackoverflow.com/questions/69466478/waiting-asynchronously-for-navigator-push-linter-warning-appears-use-build/69512692#69512692
      Future safeUseBuildContextAsynchronously() => _pageJump(context);
      await _inputPin.setMasterKey();
      return safeUseBuildContextAsynchronously();
    };
  }

  Future<dynamic> _pageJump(BuildContext context) {
    return Application.router.navigateTo(
      context,
      Routes.newWallet,
      clearStack: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ScreenUtil screenUtil = ScreenUtil();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: WalletColor.primary,
      bottomNavigationBar:
          Theme(data: Theme.of(context), child: Container(height: 0)),
      body: Theme(
        data: Theme.of(context),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SafeArea(
            maintainBottomViewPadding: true,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/background.png'),
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                    padding: const EdgeInsets.only(top: 94, bottom: 85),
                    child: Text(
                      S.of(context).pageInputPinWelcome(
                            Application.appName.replaceAll('\n', ''),
                          ),
                      style: WalletFont.font_22(
                        textStyle: TextStyle(color: WalletColor.white),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        color: WalletColor.white,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: ListView(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 34),
                            child: Text(
                              S.of(context).pageInputPinCreatePin,
                              style: WalletFont.font_18(
                                textStyle: TextStyle(
                                  color: WalletColor.black,
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text(
                              S.of(context).pageInputPinUsage,
                              style: WalletFont.font_14(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/wallet.svg',
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        S.of(context).pageInputPinUnlock,
                                        style: WalletFont.font_14(
                                          textStyle: TextStyle(
                                            color: WalletColor.primary,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/transaction.svg',
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        S.of(context).pageInputPinTransaction,
                                        style: WalletFont.font_14(
                                          textStyle: TextStyle(
                                            color: WalletColor.primary,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/setting.svg',
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        S.of(context).pageInputPinSettings,
                                        style: WalletFont.font_14(
                                          textStyle: TextStyle(
                                            color: WalletColor.primary,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            margin: const EdgeInsets.only(top: 23),
                            color: WalletColor.middleGrey,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                            child: Text(
                              S.of(context).pageInputPinInput,
                              style: WalletFont.font_14(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child:
                                _inputPinField(textEditingController1, (value) {
                              _inputPin.pin1 = value;
                            }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                            child: Text(
                              S.of(context).pageInputPinAgain,
                              style: WalletFont.font_14(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child:
                                _inputPinField(textEditingController2, (value) {
                              _inputPin.pin2 = value;
                            }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Observer(
                              builder: (_) => Text(
                                _inputPin.isUnequal
                                    ? S.of(context).pageInputPinInconsist
                                    : "",
                                style: TextStyle(
                                  color: Colors.red.shade300,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Observer(
                            builder: (_) => Container(
                              margin: EdgeInsets.only(
                                top: 16.0,
                                bottom: DeviceInfo.isIphoneXSeries() ? 34 : 20,
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenUtil.setWidth(30),
                                  vertical: DeviceInfo.isIphoneXSeries()
                                      ? screenUtil.setHeight(34)
                                      : screenUtil.setHeight(20),
                                ),
                                child: WalletTheme.button(
                                  text: S.of(context).pageInputPinNext,
                                  onPressed: _inputPin.isCompleted
                                      ? _setKey(context)
                                      : null,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
