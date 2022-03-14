import 'package:getxlearing/data/model/response/auth_token.dart';
import 'package:getxlearing/data/model/response/community.dart';

class CommunityResponse {
  bool? success;
  List<Community>? data;
  int? status;

  CommunityResponse(this.success, this.data, this.status);

  factory CommunityResponse.fromJson(dynamic json) {
    return CommunityResponse(
        json['success'] == null ? null : json['success'] as bool?,
        json['data'] == null ? null : (json['data'] as List).map((e) => Community.fromJson(e)).toList(),
        json['status'] == null ? null : json['status'] as int?);
  }
}




