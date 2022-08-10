import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/setting/edit_profile/edit_profile_controller.dart';

class EditProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(
          () => EditProfileController(repository: Get.find(),),
    );
  }

}