import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/map/google_map_controller.dart';

class GoogleMapBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GoogleMapViewController>(
      () => GoogleMapViewController(
        repository: Get.find(),
      ),
    );
  }
}
