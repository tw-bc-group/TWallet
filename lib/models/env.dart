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

  factory Env.fromDefault() {
    return Env(((builder) => builder
      ..apiGatewayBaseUrl = 'https://dev.tw-wallet.in2e.com'
      ..apiGatewayConnectTimeout = 30 * 1000
      ..web3RpcGatewayUrl = 'http://quorum.tw-wallet.in2e.com:22000'
      ..didPrefix = 'did:tw:'
      ..tokenName = 'TW Point'
      ..tokenSymbol = '￥'
      ..tokenPrecision = 2
      ..tokenHumanReadablePrecision = 2));
  }

  factory Env([void Function(EnvBuilder) updates]) = _$Env;
  Env._();
}
