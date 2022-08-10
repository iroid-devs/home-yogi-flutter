import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/rewards/rewards_controller.dart';

class RewardsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RewardsController>(
        () => RewardsController(apiRepository: Get.find()));
  }
}
