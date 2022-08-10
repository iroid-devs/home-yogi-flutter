import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/todolist/todolist_controller.dart';

class ToDoListBinding extends Bindings{
  @override
  void dependencies() {
     Get.lazyPut<ToDoListController>(() => ToDoListController());
  }

}