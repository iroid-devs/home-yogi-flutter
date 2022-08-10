import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/premium/book_inspection/book_inspection_controller.dart';

import 'book_inspection_detail_controller.dart';

class BookInspectionDetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<BookInspectionDetailController>(() => BookInspectionDetailController());
  }

}