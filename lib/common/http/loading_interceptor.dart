import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';

class LoadingInterceptor extends InterceptorsWrapper {
  static int requestNum = 0;
  YYDialog dialogInstance;

  @override
  Future onRequest(RequestOptions options) {
    if (options.extra['withoutLoading'] != true) {
      requestNum++;
      if (requestNum == 1) {
        showLoading();
      }
    }
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    if (response.request.extra['withoutLoading'] != true) {
      requestNum--;
      if (requestNum == 0) {
        hideLoading();
      }
    }
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    if (err.request.extra['withoutLoading'] != true) {
      requestNum--;
      if (requestNum == 0) {
        hideLoading();
      }
    }
    return super.onError(err);
  }

  void showLoading() {
    dialogInstance = YYDialog().build()
      ..barrierDismissible = false
      ..borderRadius = 12
      ..barrierColor = Colors.transparent
      ..backgroundColor = WalletColor.white
      ..width = 160
      ..height = 160
      ..widget(Container(
        width: 60,
        height: 60,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 50),
        child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(WalletColor.primary)),
      ))
      ..show();
  }

  void hideLoading() {
    dialogInstance.dismiss();
  }
}
