import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:tw_wallet_ui/models/verifiable_credential.dart';

class SsiService {
  static Future<VerifiableCredentialPresentationRequest> createVerifiableCredentialPresentationRequest(String url) async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      try {
        final Map<String, dynamic> json = jsonDecode(response.body)['result'] as Map<String, dynamic>;
        final List<dynamic> vcTypes = json['vc']['object']['itemListElement'] as List<dynamic>;
        return VerifiableCredentialPresentationRequest(
          name: json['vc']['agent']['legalName'] as String,
          vcTypes: vcTypes.map((vcType) => vcType.toString()).toList(),
        );
      } catch (error) {
        throw Exception('Failed to parse data: $error');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
  
  static Future<VerifiableCredentialTokenResponse> verifyAndGetPassport(List<String> tokens) async {
    const String baseUrl = "https://wallet.cn.blockchain.thoughtworks.cn";
    final response = await http.post(
      '$baseUrl/v2/verifier/health-certification/verify?simple=true',
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, List<String>> {
        'tokens': tokens,
      }),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body)['result'] as Map<String, dynamic>;
      return VerifiableCredentialTokenResponse.fromJson(json);
    } else {
      throw Exception('Failed verify and get passport');
    }
  }
}
