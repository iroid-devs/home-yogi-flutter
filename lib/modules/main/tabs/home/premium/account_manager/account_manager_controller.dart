import 'package:get/get.dart';
import 'package:home_yogi_flutter/models/response/premium/inspection_manager_response.dart';

import '../../../../../../api/api_repository.dart';

class AccountManagerController extends GetxController{
  final ApiRepository apiRepository;
  AccountManagerController({required this.apiRepository});
  var inspectionManagerResponse = InspectionManagerResponse().obs;
  getInspectionManager() async {
    var res = await apiRepository.getInspectionManager();
    if (res != null) {
      inspectionManagerResponse.value = res;
    }
    print("subscriptionPlanResponse===============${inspectionManagerResponse.value.inspectionDate}");
  }
  @override
  void onInit() {
    getInspectionManager();
    super.onInit();
  }
}