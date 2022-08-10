import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/setting/plan_and_billing/plan_and_billing_model.dart';

import '../../../../../api/api_repository.dart';
import '../../../../../models/response/home/subscription_plan_response.dart';

class PlanAndBillingController extends GetxController {
  final ApiRepository repository;
  PlanAndBillingController({required this.repository});

  //RxBool selectedIndex = false.obs;
  var subscriptionPlanResponse = <SubscriptionPlansResponse>[].obs;

  List<PlanAndBillingModel> planAndBillingModel = [
    PlanAndBillingModel(
      titleText: 'Yearly',
      totalAmount: "\$240",
      subtitle: 'Get 2 months free',
      offerAmountText:'\$200',
      isSelected: false.obs,
    ),
    PlanAndBillingModel(
      titleText: 'Quarterly',
      totalAmount: "\$80",
      subtitle: 'Available for 3 months',
      offerAmountText:'',
      isSelected: false.obs,
    ),
  ];

  planSelect(PlanAndBillingModel selectedModel){
    for(PlanAndBillingModel model in planAndBillingModel){
      if(model==selectedModel){
        model.isSelected.value = true;
      }else{
        model.isSelected.value = false;
      }
    }
  }

  RxList result = [].obs;

  getSubscriptionPlans() async {
    var res = await repository.getSubscriptionPlans();
    if (res != null && res.isNotEmpty) {
      subscriptionPlanResponse.value = res;
    }
    print("subscriptionPlanResponse===============${subscriptionPlanResponse.length}");
    print("subscriptionPlanResponse===============${subscriptionPlanResponse[0].title ?? ""}");
  }

  @override
  void onInit() {
    getSubscriptionPlans();
    super.onInit();
  }
}
