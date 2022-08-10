import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/todolist/addtask/add_task_controller.dart';

class AddTaskBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AddTaskController>(() => AddTaskController( apiRepository: Get.find(),));
  }

}