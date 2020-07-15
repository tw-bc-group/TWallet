import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/models/serializer.dart';
import 'package:tw_wallet_ui/models/webview/pincode_dialog/pincode_dialog_style.dart';
import 'package:tw_wallet_ui/models/webview/sign_transaction/transaction_info.dart';

part 'sign_transaction.g.dart';

abstract class WebviewSignTransaction
    implements Built<WebviewSignTransaction, WebviewSignTransactionBuilder> {
  static Serializer<WebviewSignTransaction> get serializer =>
      _$webviewSignTransactionSerializer;

  WebviewTransactionInfo get transactionInfo;
  WebviewPincodeDialogStyle get pincodeDialogStyle;

  static WebviewSignTransaction fromJson(dynamic serialized) {
    try {
      return serializers.deserialize(serialized,
              specifiedType: const FullType(WebviewSignTransaction))
          as WebviewSignTransaction;
    } catch (error) {
      throw Exception('webview sign transaction deserialize error, $error');
    }
  }

  factory WebviewSignTransaction(
          [Function(WebviewSignTransactionBuilder) updates]) =
      _$WebviewSignTransaction;
  WebviewSignTransaction._();
}
