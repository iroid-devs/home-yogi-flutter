import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/setting/terms_and_condition/terms_and_condition_controller.dart';

class TermsConditionBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TermsConditionController>(
          () => TermsConditionController(),
    );
  }

}