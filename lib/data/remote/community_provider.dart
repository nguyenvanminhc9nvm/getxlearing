import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:getxlearing/data/local/app_storage_helper.dart';
import 'package:getxlearing/data/model/response/base_response.dart';
import 'package:getxlearing/data/model/response/community.dart';

class CommunityProvider extends GetConnect {
  final AppStorageHelper _storageHelper = AppStorageHelper();

  Future<CommunityResponse> fetchListCommunity(
      String section, String sort, int page, String window) async {
    final response = await get("/$section/$sort/$window/$page");
    if (response.status.hasError) {
      return Future.error(response.statusText ?? "");
    } else {
      var json = jsonDecode(response.bodyString ?? "");
      var responseData = CommunityResponse.fromJson(json);
      print("responseData: ${responseData.data?.map((e) => e.views)}");
      return Future.value(responseData);
    }
  }

  @override
  void onInit() {
    httpClient.baseUrl = "https://api.imgur.com/3/gallery";
    httpClient.addRequestModifier((Request request) {
      request.headers['authorization'] = "Bearer ${_storageHelper.readToken()}";
      return request;
    });
  }
}
