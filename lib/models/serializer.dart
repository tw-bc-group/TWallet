import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'identity.dart';

part 'serializer.g.dart';

@SerializersFor([Identity])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
