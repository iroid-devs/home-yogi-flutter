import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/setting/refer_and_earn/refer_controller.dart';

class ReferBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ReferController>(
          () => ReferController(),
    );
  }

}