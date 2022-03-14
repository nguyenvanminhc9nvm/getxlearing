import 'package:get/get.dart';
import 'package:getxlearing/data/local/app_storage_helper.dart';
import 'package:getxlearing/data/model/request/access_token_request.dart';
import 'package:getxlearing/data/model/response/auth_token.dart';
import 'package:getxlearing/data/remote/authorization_provider.dart';
import 'package:getxlearing/utils/constants/constants.dart';

class SplashController extends GetxController
    with StateMixin<AccessTokenResponse> {
  final AuthorizationProvider authorizationProvider;
  final AppStorageHelper _storageHelper = AppStorageHelper();
  
  SplashController(this.authorizationProvider);

  @override
  void onInit() {
    if (_storageHelper.readToken().isEmpty) {
      change(null, status: RxStatus.loading());
      final request = AccessTokenRequest(Constants.REFRESH_TOKEN,
          Constants.CLIENT_ID, Constants.CLIENT_SECRET, "refresh_token");
      authorizationProvider.refreshToken(request).then((value) {
        _storageHelper.writeToken(value.accessToken ?? "");
        change(value, status: RxStatus.success());
      }, onError: (error) {
        change(null, status: RxStatus.error(error.toString()));
      });
    }
    super.onInit();
  }
}
