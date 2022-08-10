import 'package:get/instance_manager.dart';
import 'checklist_controller.dart';

class CheckListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckListController>(
      () => CheckListController(
        apiRepository: Get.find(),
      ),
    );
  }
}
