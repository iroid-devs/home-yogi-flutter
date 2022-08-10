import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/auth/login/sign_in_with_email/sign_in_with_email_controller.dart';
class SignInWithEmailBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInWithEmailController>(
      () => SignInWithEmailController(
        repository: Get.find(),
      ),
    );
  }
}
