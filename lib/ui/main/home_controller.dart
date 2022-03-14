import 'package:get/get.dart';
import 'package:getxlearing/data/local/app_storage_helper.dart';
import 'package:getxlearing/data/model/response/community.dart';
import 'package:getxlearing/data/remote/community_provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeController extends GetxController with StateMixin<List<Community>> {
  final CommunityProvider communityProvider;
  HomeController(this.communityProvider);

  final RefreshController refreshController = RefreshController(initialRefresh: false);
  final List<Community> communities = [];
  var page = 1;

  @override
  void onInit() {
    triggerRefresh();
    super.onInit();
  }

  void triggerRefresh() {
    communities.clear();
    didLoadListCommunities(1);
    refreshController.refreshCompleted();
  }

  void triggerLoadMore() {
    page++;
    didLoadListCommunities(page);
    refreshController.loadComplete();
  }

  void didLoadListCommunities(int page) {
    communityProvider.fetchListCommunity("hot", "viral", page, "day").then((value) {
      if (value.data != null) {
        communities.addAll(value.data!.take(10));
        change(communities, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.error("an error"));
      }
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}