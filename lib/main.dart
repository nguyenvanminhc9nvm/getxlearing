import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getxlearing/binding/authorization_binding.dart';
import 'package:getxlearing/ui/main/home_screen.dart';
import 'package:getxlearing/ui/splash/splash_screen.dart';
import 'package:getxlearing/utils/constants/route_const.dart';

import 'binding/community_binding.dart';

void main() async {
  await GetStorage.init();
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: RouteConst.splash,
      getPages: [
        GetPage(
          name: RouteConst.splash,
          page: () => const SplashScreen(),
          binding: AuthorizationBinding(),
        ),
        GetPage(
          name: RouteConst.home,
          page: () => const HomeScreen(),
          binding: CommunityBinding(),
        )
      ],
    );
  }
}
