import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxlearing/ui/main/home_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (state) => SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          footer: CustomFooter(
            builder: (context, mode) {
              Widget body;
              if (mode == LoadStatus.idle) {
                body = const CupertinoActivityIndicator();
              } else if (mode == LoadStatus.loading) {
                body = const CupertinoActivityIndicator();
              } else if (mode == LoadStatus.failed) {
                body = const Text("Load Failed!Click retry!");
              } else if (mode == LoadStatus.canLoading) {
                body = const Text("release to load more");
              } else {
                body = const Text("No more Data");
              }
              return SizedBox(
                height: 55.0,
                child: Center(child: body),
              );
            },
          ),
          controller: controller.refreshController,
          onRefresh: () {
            controller.triggerRefresh();
          },
          onLoading: () {
            controller.triggerLoadMore();
          },
          child: ListView.builder(
            itemBuilder: (c, i) => Card(
              child: Center(
                child: Text("${state?[i].views}"),
              ),
            ),
            itemExtent: 100.0,
            itemCount: state?.length,
          ),
        ),
      ),
    );
  }
}
