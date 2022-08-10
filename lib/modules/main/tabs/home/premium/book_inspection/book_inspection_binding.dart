import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/premium/book_inspection/book_inspection_controller.dart';

class BookInspectionBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<BookInspectionController>(() => BookInspectionController());
  }

}