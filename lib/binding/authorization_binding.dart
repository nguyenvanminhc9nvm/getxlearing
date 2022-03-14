import 'package:get/get.dart';
import 'package:getxlearing/data/remote/authorization_provider.dart';
import 'package:getxlearing/ui/splash/splash_controller.dart';

class AuthorizationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthorizationProvider());
    Get.put(SplashController(Get.find()));
  }
}