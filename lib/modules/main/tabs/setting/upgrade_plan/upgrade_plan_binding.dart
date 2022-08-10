import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:home_yogi_flutter/modules/main/tabs/setting/upgrade_plan/upgrade_plan_controller.dart';

class UpgradePlanBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<UpgradePlanController>(() => UpgradePlanController(apiRepository: Get.find()));
  }
}