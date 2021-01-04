import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:tw_wallet_ui/models/verifiable_credential.dart';

class SsiService {
  static Future<VerifiableCredentialPresentationRequest> createVerifiableCredentialPresentationRequest(String url) async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(utf8.decode(response.bodyBytes))['result'] as Map<String, dynamic>;
      return VerifiableCredentialPresentationRequest.fromJson(json);
    } else {
      throw Exception('Failed to load data');
    }
  }
  
  static Future<VerifiableCredentialTokenResponse> verifyAndGetPassport(List<String> tokens) async {
    const String baseUrl = "https://wallet.cn.blockchain.thoughtworks.cn";
    final response = await http.post(
      '$baseUrl/v2/verifier/health-certification/verify',
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
