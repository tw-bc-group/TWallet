import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/models/verifiable_credential.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:validators/validators.dart';

class SsiService {
  static Future<VerifiableCredentialPresentationRequest>
      createVerifiableCredentialPresentationRequest(String url) async {
    final response = await http.get(Uri.dataFromString(url));
    if (response.statusCode == 200) {
      try {
        final Map<String, dynamic> json =
            jsonDecode(response.body)['result'] as Map<String, dynamic>;
        final List<dynamic> vcTypes =
            json['vc']['object']['itemListElement'] as List<dynamic>;
        return VerifiableCredentialPresentationRequest(
          id: json['vc']['target']['identifier'] as String,
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

  static Future<VerifiableCredentialTokenResponse> verifyAndGetPassport(
    String verifierId,
    List<String?> tokens,
  ) async {
    final response = await http.post(
      Uri.dataFromString(
        '${Application.globalEnv.apiGatewayBaseUrl}v2/verifier/health-certification/verify?simple=true',
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'verifierId': verifierId,
        'tokens': tokens,
      }),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> json =
          jsonDecode(response.body)['result'] as Map<String, dynamic>;
      return VerifiableCredentialTokenResponse.fromJson(json);
    } else {
      throw Exception('Failed verify and get passport');
    }
  }

  static String getSelectDid() {
    final String did = Get.find<IdentityStore>().selectedIdentityDid;
    if (isNull(did) || did.isEmpty) {
      throw Exception('无法获取did，请创建身份后重试');
    }
    return did;
  }
}
