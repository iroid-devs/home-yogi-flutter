import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/progress_report/progress_report_controller.dart';

class ProgressReportBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ProgressReportController>(
          () => ProgressReportController(
        apiRepository: Get.find(),
      ),
    );
  }
}