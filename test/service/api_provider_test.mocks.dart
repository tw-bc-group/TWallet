// Mocks generated by Mockito 5.3.0 from annotations
// in tw_wallet_ui/test/service/api_provider_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dio/dio.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:optional/optional.dart' as _i2;
import 'package:tw_wallet_ui/common/http/http_client.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeOptional_0<T> extends _i1.SmartFake implements _i2.Optional<T> {
  _FakeOptional_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeResponse_1<T> extends _i1.SmartFake implements _i3.Response<T> {
  _FakeResponse_1(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [HttpClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i4.HttpClient {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Optional<_i3.Response<dynamic>>> get(String? url,
          {bool? loading = true, bool? throwError = false}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #get, [url], {#loading: loading, #throwError: throwError}),
              returnValue: _i5.Future<_i2.Optional<_i3.Response<dynamic>>>.value(
                  _FakeOptional_0<_i3.Response<dynamic>>(
                      this, Invocation.method(#get, [url], {#loading: loading, #throwError: throwError}))))
          as _i5.Future<_i2.Optional<_i3.Response<dynamic>>>);
  @override
  _i5.Future<_i3.Response<dynamic>> get_(String? url,
          {bool? loading = true, bool? throwError = false}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #get_, [url], {#loading: loading, #throwError: throwError}),
              returnValue: _i5.Future<_i3.Response<dynamic>>.value(
                  _FakeResponse_1<dynamic>(
                      this, Invocation.method(#get_, [url], {#loading: loading, #throwError: throwError}))))
          as _i5.Future<_i3.Response<dynamic>>);
  @override
  _i5.Future<_i2.Optional<_i3.Response<dynamic>>> post(
          String? url, Map<String, dynamic>? data,
          {bool? loading = true, bool? throwError = false}) =>
      (super.noSuchMethod(Invocation.method(#post, [url, data], {#loading: loading, #throwError: throwError}),
              returnValue: _i5.Future<_i2.Optional<_i3.Response<dynamic>>>.value(
                  _FakeOptional_0<_i3.Response<dynamic>>(this,
                      Invocation.method(#post, [url, data], {#loading: loading, #throwError: throwError}))))
          as _i5.Future<_i2.Optional<_i3.Response<dynamic>>>);
  @override
  _i5.Future<_i3.Response<dynamic>> post_(String? url, Map<String, dynamic>? data,
          {bool? loading = true, bool? throwError = false}) =>
      (super.noSuchMethod(Invocation.method(#post_, [url, data], {#loading: loading, #throwError: throwError}),
              returnValue: _i5.Future<_i3.Response<dynamic>>.value(
                  _FakeResponse_1<dynamic>(
                      this,
                      Invocation.method(
                          #post_, [url, data], {#loading: loading, #throwError: throwError}))))
          as _i5.Future<_i3.Response<dynamic>>);
  @override
  _i5.Future<_i2.Optional<_i3.Response<dynamic>>> patch(
          String? url, Map<String, dynamic>? data,
          {bool? loading = true, bool? throwError = false}) =>
      (super.noSuchMethod(Invocation.method(#patch, [url, data], {#loading: loading, #throwError: throwError}),
              returnValue: _i5.Future<_i2.Optional<_i3.Response<dynamic>>>.value(
                  _FakeOptional_0<_i3.Response<dynamic>>(this,
                      Invocation.method(#patch, [url, data], {#loading: loading, #throwError: throwError}))))
          as _i5.Future<_i2.Optional<_i3.Response<dynamic>>>);
  @override
  _i5.Future<_i3.Response<dynamic>> patch_(String? url, Map<String, dynamic>? data,
          {bool? loading = true, bool? throwError = false}) =>
      (super.noSuchMethod(Invocation.method(#patch_, [url, data], {#loading: loading, #throwError: throwError}),
              returnValue: _i5.Future<_i3.Response<dynamic>>.value(
                  _FakeResponse_1<dynamic>(
                      this,
                      Invocation.method(
                          #patch_, [url, data], {#loading: loading, #throwError: throwError}))))
          as _i5.Future<_i3.Response<dynamic>>);
}
