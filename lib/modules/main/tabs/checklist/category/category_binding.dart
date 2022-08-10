import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/checklist/category/category_controller.dart';

class CheckListCategoryBinding extends Bindings{
  @override
  void dependencies() {
     Get.lazyPut<CheckListCategoryController>(() => CheckListCategoryController( apiRepository: Get.find(),));
  }

}