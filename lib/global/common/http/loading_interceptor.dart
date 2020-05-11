import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';

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

  showLoading() {
    dialogInstance = YYDialog().build()
      ..barrierColor = Color.fromRGBO(60, 60, 60, 0.1)
      ..backgroundColor = Colors.transparent
      ..width = 60
      ..height = 60
      ..widget(Padding(
          padding: EdgeInsets.only(top: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
              ],
            ),
          )))
      ..show();
  }

  hideLoading() {
    dialogInstance.dismiss();
  }
}
