import 'package:get/instance_manager.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        apiRepository: Get.find(),
      ),
    );
  }
}
