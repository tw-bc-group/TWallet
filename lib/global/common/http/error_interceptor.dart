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
    switch (err.type) {
      case DioErrorType.CONNECT_TIMEOUT:
        showErrorSnackbar('连接超时');
        break;

      case DioErrorType.SEND_TIMEOUT:
        showErrorSnackbar('发送超时');
        break;

      case DioErrorType.RECEIVE_TIMEOUT:
        showErrorSnackbar('接收超时');
        break;

      case DioErrorType.CANCEL:
        showErrorSnackbar('用户取消');
        break;

      default:
        if (err != null) {
          if (err.response.statusCode == 400) {
            if (err.response.data['code'] == 40000) {
              showErrorSnackbar(err.response.data['msg']);
            } else {
              showErrorSnackbar('请求参数错误');
            }
          }
          if (err.response.statusCode >= 500) {
            showErrorSnackbar('服务端错误');
          }
        } else {
          showErrorSnackbar('未知错误');
        }
        break;
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
