import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/premium/book_inspection/book_inspection_controller.dart';

class BookInspectionConfirmBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<BookInspectionController>(() => BookInspectionController(apiRepository: Get.find()));
  }

}