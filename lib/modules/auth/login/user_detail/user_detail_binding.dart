import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/auth/login/user_detail/user_detail_controller.dart';

class UserDetailBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserDetailController>(
      () => UserDetailController(
        repository: Get.find(),
      ),
    );
  }
}
