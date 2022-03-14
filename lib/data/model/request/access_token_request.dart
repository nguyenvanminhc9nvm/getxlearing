class AccessTokenRequest {
  final String refreshToken;
  final String clientId;
  final String clientSecret;
  final String groupId;

  AccessTokenRequest(this.refreshToken, this.clientId, this.clientSecret, this.groupId);

  Map<String, dynamic> toJson() => {
    "refresh_token": refreshToken,
    "client_id": clientId,
    "client_secret": clientSecret,
    "grant_type": groupId
  };
}