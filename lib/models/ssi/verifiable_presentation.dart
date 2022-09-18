import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'verifiable_presentation.g.dart';

abstract class VerifiablePresentation extends Object
    implements Built<VerifiablePresentation, VerifiablePresentationBuilder> {
  static Serializer<VerifiablePresentation> get serializer =>
      _$verifiablePresentationSerializer;
  VObject get object;
  VTarget get target;
  VAgent get agent;

  factory VerifiablePresentation([
    Function(VerifiablePresentationBuilder) updates,
  ]) = _$VerifiablePresentation;
  VerifiablePresentation._();
}

abstract class VObject extends Object
    implements Built<VObject, VObjectBuilder> {
  static Serializer<VObject> get serializer => _$vObjectSerializer;
  BuiltList<String> get itemListElement;

  factory VObject([Function(VObjectBuilder) updates]) = _$VObject;
  VObject._();
}

abstract class VTarget extends Object
    implements Built<VTarget, VTargetBuilder> {
  static Serializer<VTarget> get serializer => _$vTargetSerializer;
  String get identifier;

  factory VTarget([Function(VTargetBuilder) updates]) = _$VTarget;
  VTarget._();
}

abstract class VAgent extends Object implements Built<VAgent, VAgentBuilder> {
  static Serializer<VAgent> get serializer => _$vAgentSerializer;
  String get legalName;

  factory VAgent([Function(VAgentBuilder) updates]) = _$VAgent;
  VAgent._();
}
