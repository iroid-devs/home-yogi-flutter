import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/premium/summary_report/summary_report_controller.dart';

class SummaryReportBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SummaryReportController>(() => SummaryReportController());
  }

}