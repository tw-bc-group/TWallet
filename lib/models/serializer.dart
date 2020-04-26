import 'package:built_collection/built_collection.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:tw_wallet_ui/models/api_response.dart';
import 'package:tw_wallet_ui/models/contract.dart';
import 'package:tw_wallet_ui/models/transaction.dart';
import 'package:tw_wallet_ui/models/tw_balance.dart';
import 'package:tw_wallet_ui/models/tx_status.dart';

import 'amount.dart';
import 'identity.dart';

part 'serializer.g.dart';

@SerializersFor(
    [ApiResponseNew, Contract, Identity, Transaction, TwBalance, TxStatus])
final Serializers serializers = (_$serializers.toBuilder()
      ..add(Iso8601DateTimeSerializer())
      ..add(AmountSerializer())
      ..addBuilderFactory(FullType(BuiltList, [FullType(Transaction)]),
          () => ListBuilder<Transaction>())
      ..addBuilderFactory(FullType(ApiResponseNew, [FullType(Contract)]),
          () => ApiResponseNewBuilder<Contract>())
      ..addBuilderFactory(FullType(ApiResponseNew, [FullType(Transaction)]),
          () => ApiResponseNewBuilder<Transaction>())
      ..addBuilderFactory(
          FullType(ApiResponseNew, [
            FullType(BuiltList, [FullType(Transaction)])
          ]),
          () => ApiResponseNewBuilder<BuiltList<Transaction>>())
      ..addBuilderFactory(FullType(ApiResponseNew, [FullType(TwBalance)]),
          () => ApiResponseNewBuilder<TwBalance>())
      ..addPlugin(StandardJsonPlugin()))
    .build();
