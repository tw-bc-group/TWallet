import 'package:built_collection/built_collection.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:tw_wallet_ui/models/api_response.dart';
import 'package:tw_wallet_ui/models/contract.dart';
import 'package:tw_wallet_ui/models/health_certification.dart';
import 'package:tw_wallet_ui/models/transaction.dart';
import 'package:tw_wallet_ui/models/tw_balance.dart';
import 'package:tw_wallet_ui/models/tx_status.dart';
import 'package:tw_wallet_ui/models/webview/pincode/pincode_close.dart';
import 'package:tw_wallet_ui/models/webview/pincode/pincode_error_msg.dart';
import 'package:tw_wallet_ui/models/webview/pincode/pincode_hint.dart';
import 'package:tw_wallet_ui/models/webview/pincode/pincode_input.dart';
import 'package:tw_wallet_ui/models/webview/pincode/pincode_style.dart';
import 'package:tw_wallet_ui/models/webview/pincode/pincode_title.dart';
import 'package:tw_wallet_ui/models/webview/sign_transaction/parameter.dart';
import 'package:tw_wallet_ui/models/webview/sign_transaction/sign_transaction.dart';
import 'package:tw_wallet_ui/models/webview/sign_transaction/transaction_info.dart';
import 'package:tw_wallet_ui/models/webview/webview_request.dart';
import 'package:tw_wallet_ui/models/webview/webview_request_method.dart';
import 'package:tw_wallet_ui/views/health_certificate/health_certificate_page_store.dart';

import 'amount.dart';
import 'health_certification_token.dart';
import 'identity.dart';

part 'serializer.g.dart';

@SerializersFor([
  ApiResponse,
  Contract,
  Identity,
  Transaction,
  TwBalance,
  TxStatus,
  HealthCertification,
  HealthCertificationSub,
  HealthCertificationToken,
  HealthyStatus,
  SelectOption,
  WebviewRequest,
  WebviewRequestMethod,
  WebviewParameter,
  WebviewParameterType,
  WebviewTransactionInfo,
  WebviewSignTransaction,
  WebviewPincodeStyle,
  WebviewPincodeClose,
  WebviewPincodeErrorMsg,
  WebviewPincodeHint,
  WebviewPincodeInput,
  WebviewPincodeTitle,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..add(Iso8601DateTimeSerializer())
      ..add(AmountSerializer())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Transaction)]),
          () => ListBuilder<Transaction>())
      ..addBuilderFactory(const FullType(ApiResponse, [FullType(Contract)]),
          () => ApiResponseBuilder<Contract>())
      ..addBuilderFactory(const FullType(ApiResponse, [FullType(Transaction)]),
          () => ApiResponseBuilder<Transaction>())
      ..addBuilderFactory(
          const FullType(ApiResponse, [
            FullType(BuiltList, [FullType(Transaction)])
          ]),
          () => ApiResponseBuilder<BuiltList<Transaction>>())
      ..addBuilderFactory(const FullType(ApiResponse, [FullType(TwBalance)]),
          () => ApiResponseBuilder<TwBalance>())
      ..addBuilderFactory(
          const FullType(ApiResponse, [FullType(HealthCertificationToken)]),
          () => ApiResponseBuilder<HealthCertificationToken>())
      ..addBuilderFactory(
          const FullType(WebviewRequest), () => WebviewRequestBuilder())
      ..addBuilderFactory(
          const FullType(WebviewParameter, [FullType(WebviewParameterType)]),
          () => WebviewParameterBuilder())
      ..addBuilderFactory(
          const FullType(WebviewTransactionInfo,
              [FullType(BuiltList), FullType(WebviewParameter)]),
          () => WebviewTransactionInfoBuilder())
      ..addBuilderFactory(
          const FullType(
            WebviewSignTransaction,
            [
              FullType(WebviewTransactionInfo),
              FullType(WebviewPincodeStyle),
            ],
          ),
          () => WebviewSignTransactionBuilder)
      ..addBuilderFactory(
          const FullType(
            WebviewPincodeStyle,
            [
              FullType(WebviewPincodeClose),
              FullType(WebviewPincodeErrorMsg),
              FullType(WebviewPincodeHint),
              FullType(WebviewPincodeInput),
              FullType(WebviewPincodeTitle)
            ],
          ),
          () => WebviewPincodeStyleBuilder)
      ..addPlugin(StandardJsonPlugin()))
    .build();
