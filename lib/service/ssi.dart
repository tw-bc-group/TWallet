import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:tw_wallet_ui/models/verifiable_credential.dart';

class SsiService {
  static Future<VerifiableCredentialPresentationRequest> createVerifiableCredentialPresentationRequest(String url) async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body)['result'] as Map<String, dynamic>;
      return VerifiableCredentialPresentationRequest.fromJson(json);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
