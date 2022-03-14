import 'package:get/get.dart';
import 'package:getxlearing/data/remote/community_provider.dart';
import 'package:getxlearing/ui/main/home_controller.dart';

class CommunityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CommunityProvider());
    Get.put(HomeController(Get.find()));
  }
}