import 'package:get/get.dart';

import 'package:home_yogi_flutter/modules/onboarding/onboarding_controller.dart';

class OnboardingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(
      () => OnboardingController(
        Get.find(),
      ),
    );
  }
}
