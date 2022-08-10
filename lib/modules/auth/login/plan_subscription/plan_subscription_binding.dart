import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/auth/login/plan_subscription/plan_subscription_controller.dart';

class PlanAndSubscriptionBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlanAndSubscriptionController>(
      () => PlanAndSubscriptionController(
        repository: Get.find(),
      ),
    );
  }
}
