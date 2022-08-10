import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/level/show_level_rank/show_level_controller.dart';

class ShowLevelBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowLevelController>(
      () => ShowLevelController(
        apiRepository: Get.find(),
      ),
    );
  }
}
