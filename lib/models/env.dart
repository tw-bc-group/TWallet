import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'env.g.dart';

abstract class Env extends Object implements Built<Env, EnvBuilder> {
  static Serializer<Env> get serializer => _$envSerializer;

  String get apiGatewayBaseUrl;
  int get apiGatewayConnectTimeout;
  String get web3RpcGatewayUrl;
  String get didPrefix;
  String get tokenName;
  String get tokenSymbol;
  int get tokenPrecision;
  int get tokenHumanReadablePrecision;

  factory Env([void Function(EnvBuilder) updates]) = _$Env;

  factory Env.fromDefault() {
    return Env((builder) => builder
      ..apiGatewayBaseUrl = 'https://wallet.blockchain.thoughtworks.cn:10443'
      ..apiGatewayConnectTimeout = 30 * 1000
      ..web3RpcGatewayUrl = 'http://node1.quorum.cn.blockchain.thoughtworks.cn'
      ..didPrefix = 'did:tw:'
      ..tokenName = 'TW Point'
      ..tokenSymbol = '￥'
      ..tokenPrecision = 2
      ..tokenHumanReadablePrecision = 2);
  }

  Env._();
}
