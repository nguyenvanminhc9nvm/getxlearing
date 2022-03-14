import 'package:get_storage/get_storage.dart';

class AppStorageHelper {
  static final _otherBox = GetStorage();
  String tokenKey = "TOKEN_PREFERENCES";

  String readToken() => _otherBox.read(tokenKey);

  void writeToken(String token) {
    _otherBox.write(tokenKey, token);
  }
}