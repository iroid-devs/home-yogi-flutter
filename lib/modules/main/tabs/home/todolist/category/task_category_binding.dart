import 'package:get/get.dart';
import 'task_category_controller.dart';

class TaskCategoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskCategoryController>(
      () => TaskCategoryController(
        apiRepository: Get.find(),
      ),
    );
  }
}
