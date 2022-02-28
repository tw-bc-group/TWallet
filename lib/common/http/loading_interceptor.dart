import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:tw_wallet_ui/service/progress_dialog.dart';

class LoadingInterceptor extends InterceptorsWrapper {
  final ProgressDialog _dialog = g.Get.find();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.extra['withoutLoading'] != true) {
      _dialog.show();
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.requestOptions.extra['withoutLoading'] != true) {
      _dialog.dismiss();
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.requestOptions.extra['withoutLoading'] != true) {
      _dialog.dismiss();
    }
    super.onError(err, handler);
  }
}
