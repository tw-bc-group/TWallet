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
import 'package:tw_wallet_ui/views/health_certificate/health_certificate_page_store.dart';

import 'amount.dart';
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
  HealthyStatus,
  SelectOption,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..add(Iso8601DateTimeSerializer())
      ..add(AmountSerializer())
      ..addBuilderFactory(FullType(BuiltList, [FullType(Transaction)]),
          () => ListBuilder<Transaction>())
      ..addBuilderFactory(FullType(ApiResponse, [FullType(Contract)]),
          () => ApiResponseBuilder<Contract>())
      ..addBuilderFactory(FullType(ApiResponse, [FullType(Transaction)]),
          () => ApiResponseBuilder<Transaction>())
      ..addBuilderFactory(
          FullType(ApiResponse, [
            FullType(BuiltList, [FullType(Transaction)])
          ]),
          () => ApiResponseBuilder<BuiltList<Transaction>>())
      ..addBuilderFactory(FullType(ApiResponse, [FullType(TwBalance)]),
          () => ApiResponseBuilder<TwBalance>())
      ..addBuilderFactory(
          FullType(ApiResponse, [FullType(HealthCertification)]),
          () => ApiResponseBuilder<HealthCertification>())
      ..addPlugin(StandardJsonPlugin()))
    .build();
