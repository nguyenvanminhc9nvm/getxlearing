class AccessTokenResponse {
  String? accessToken;
  int? expiresIn;
  String? tokenType;
  String? scope;
  String? refreshToken;
  int? accountId;
  String? accountUserName;

  AccessTokenResponse(this.accessToken, this.expiresIn, this.tokenType,
      this.scope, this.refreshToken, this.accountId, this.accountUserName);

  factory AccessTokenResponse.fromJson(dynamic json) {
    return AccessTokenResponse(
        json['access_token'] as String?,
        json['expires_in'] as int?,
        json['token_type'] as String?,
        json['scope'] as String?,
        json['refresh_token'] as String?,
        json['account_id'] as int?,
        json['account_username'] as String?);
  }
}
