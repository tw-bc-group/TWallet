import 'package:dio/dio.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/service/progress_dialog.dart';

class LoadingInterceptor extends InterceptorsWrapper {
  final ProgressDialog _dialog = getIt<ProgressDialog>();

  @override
  Future onRequest(RequestOptions options) {
    if (options.extra['withoutLoading'] != true) {
      _dialog.show();
    }
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    if (response.request.extra['withoutLoading'] != true) {
      _dialog.dismiss();
    }
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    if (err.request.extra['withoutLoading'] != true) {
      _dialog.dismiss();
    }
    return super.onError(err);
  }
}
