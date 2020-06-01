import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/widgets/hint_dialog.dart';

class ErrorInterceptor extends InterceptorsWrapper {
  static BuildContext context;

  @override
  Future onError(DioError err) {
    switch (err.type) {
      case DioErrorType.CONNECT_TIMEOUT:
        showErrorDialog('连接超时');
        break;

      case DioErrorType.SEND_TIMEOUT:
        showErrorDialog('发送超时');
        break;

      case DioErrorType.RECEIVE_TIMEOUT:
        showErrorDialog('接收超时');
        break;

      case DioErrorType.CANCEL:
        showErrorDialog('用户取消');
        break;

      default:
        if (err.response != null) {
          if (err.response.statusCode == 400) {
            if (err.response.data['code'] == 40000) {
              showErrorDialog(
                err.response.data['msg'] as String,
              );
            } else {
              showErrorDialog('请求失败，请稍后再试..');
            }
          }
          if (err.response.statusCode >= 500) {
            showErrorDialog('服务端错误');
          }
        } else {
          showErrorDialog('未知错误');
        }
        break;
    }

    return super.onError(err);
  }

  Future<void> showErrorDialog(String errorMsg) async {
    await showDialogSample(DialogType.error, errorMsg);
  }
}
