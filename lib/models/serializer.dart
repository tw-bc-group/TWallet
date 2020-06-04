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
import 'package:tw_wallet_ui/models/webview/webview_request.dart';
import 'package:tw_wallet_ui/models/webview/webview_request_type.dart';
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
  WebviewRequestType
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
      ..addBuilderFactory(const FullType(WebviewRequest),
          () => WebviewRequestBuilder())
      ..addPlugin(StandardJsonPlugin()))
    .build();
