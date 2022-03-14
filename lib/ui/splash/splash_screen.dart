import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getxlearing/ui/splash/splash_controller.dart';
import 'package:getxlearing/utils/constants/route_const.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.toNamed(RouteConst.home);
      },),
      body: Container(
        child: controller.obx(
          (state) {
            return Center(
              child: Text("${state?.accessToken}"),
            );
          },
          onError: (error) => Center(
            child: Text(
              'Error: $error',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          onLoading: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
