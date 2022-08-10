import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../../api/api_repository.dart';
import '../../../../../models/response/home/subscription_plan_response.dart';

class UpgradePlanController extends GetxController{
  final ApiRepository apiRepository;
  UpgradePlanController({required this.apiRepository});

  var subscriptionPlanResponse = SubscriptionPlansResponse().obs;

  // getSubscriptionPlans() async {
  //   var res = await apiRepository.getSubscriptionPlans();
  //   if (res != null) {
  //     subscriptionPlanResponse.value = res;
  //   }
  //   print("subscriptionPlanResponse===============${subscriptionPlanResponse.value}");
  //   print("subscriptionPlanResponse===============${subscriptionPlanResponse.value.title ?? ""}");
  // }


}