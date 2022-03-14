import 'dart:convert';
import 'package:get/get.dart';
import 'package:getxlearing/data/model/request/access_token_request.dart';
import 'package:getxlearing/data/model/response/auth_token.dart';
import 'package:getxlearing/data/model/response/base_response.dart';

class AuthorizationProvider extends GetConnect {

  Future<AccessTokenResponse> refreshToken(
      AccessTokenRequest accessTokenRequest) async {
    final response = await post("https://api.imgur.com/oauth2/token", accessTokenRequest.toJson());
    if (response.status.hasError) {
      return Future.error(response.statusText ?? "");
    } else {
      final json = jsonDecode(response.bodyString ?? "");
      final responseData = AccessTokenResponse.fromJson(json);
      return Future.value(responseData);
    }
  }
}
