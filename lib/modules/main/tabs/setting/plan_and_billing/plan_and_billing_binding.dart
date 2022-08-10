import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/setting/plan_and_billing/plan_and_billing_controller.dart';

class PlanAndBillingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlanAndBillingController>(
      () => PlanAndBillingController(
        repository: Get.find(),
      ),
    );
  }
}
