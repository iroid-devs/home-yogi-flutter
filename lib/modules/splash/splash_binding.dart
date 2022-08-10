import 'package:get/get.dart';

import 'package:home_yogi_flutter/modules/splash/splash_controller.dart';

class SplashBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(
        apiRepository: Get.find(),
      ),
    );
  }
}
