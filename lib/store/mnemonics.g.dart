// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mnemonics.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MnemonicsStore on MnemonicsBase, Store {
  Computed<int>? _$indexComputed;

  @override
  int get index => (_$indexComputed ??=
          Computed<int>(() => super.index, name: 'MnemonicsBase.index'))
      .value;
  Computed<String>? _$mnemonicsComputed;

  @override
  String get mnemonics =>
      (_$mnemonicsComputed ??= Computed<String>(() => super.mnemonics,
              name: 'MnemonicsBase.mnemonics'))
          .value;

  late final _$valueAtom = Atom(name: 'MnemonicsBase.value', context: context);

  @override
  Tuple2<int, String> get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(Tuple2<int, String> value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$saveAsyncAction =
      AsyncAction('MnemonicsBase.save', context: context);

  @override
  Future<void> save({int newIndex = 0}) {
    return _$saveAsyncAction.run(() => super.save(newIndex: newIndex));
  }

  @override
  String toString() {
    return '''
value: ${value},
index: ${index},
mnemonics: ${mnemonics}
    ''';
  }
}
