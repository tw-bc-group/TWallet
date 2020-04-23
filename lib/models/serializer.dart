import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:tw_wallet_ui/models/api_response.dart';
import 'package:tw_wallet_ui/models/tw_balance.dart';

import 'identity.dart';

part 'serializer.g.dart';

@SerializersFor([Identity, TwBalance, ApiResponseNew])
final Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(FullType(ApiResponseNew, [FullType(TwBalance)]),
          () => ApiResponseNewBuilder<TwBalance>())
      ..addPlugin(StandardJsonPlugin()))
    .build();
