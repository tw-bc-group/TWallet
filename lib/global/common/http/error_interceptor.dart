import 'package:dio/dio.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class ErrorInterceptor extends InterceptorsWrapper {

  static BuildContext context;

  @override
  Future onRequest(RequestOptions options) {
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    if (err.response.statusCode == 400 && err.response.data['code'] == 40000) {
      showErrorSnackbar(err.response.data['msg']);
    }
    if (err.response.statusCode >= 500) {
      showErrorSnackbar('服务端错误');
    }
    return super.onError(err);
  }

  showErrorSnackbar(String errorMsg) {
    Flushbar(
      message: errorMsg,
      flushbarPosition: FlushbarPosition.BOTTOM,
      flushbarStyle: FlushbarStyle.FLOATING,
      backgroundColor: Colors.black87,
      isDismissible: false,
      duration: Duration(seconds: 4),
    ).show(context);
  }
}