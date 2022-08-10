import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/auth/login/plan_subscription/model/paln_subcription_model.dart';

import '../../../../../../api/api_repository.dart';

class PlanAndSubscriptionController extends GetxController {
  final ApiRepository repository;

  PlanAndSubscriptionController({required this.repository});

  List<PlanSubscriptionModel> planSubscriptionList = [
    PlanSubscriptionModel(
      planId: 1,
      planTitle: 'Free plan',
      planBenefits: [
        'Self assess your home',
        'Seasonal examination',
        'Checklist'
      ],
      isActive: false.obs,
    ),
    PlanSubscriptionModel(
      planId: 2,
      planTitle: 'Yearly / Quarterly subscription',
      planBenefits: [
        'Hire us to assess your home',
        'Account manager',
        'Provide home data & history'
      ],
      isActive: false.obs,
    ),
  ];

  changePlan(int planId){
    for(PlanSubscriptionModel planSubscriptionModel in planSubscriptionList){
      if(planSubscriptionModel.planId == planId){
        planSubscriptionModel.isActive.value = true;
      }else{
        planSubscriptionModel.isActive.value = false;
      }
    }
  }

  isFreePlanSelected(){
    for(PlanSubscriptionModel planSubscriptionModel in planSubscriptionList){
      if(planSubscriptionModel.isActive.value && planSubscriptionModel.planId==1){
        return true;
      }
    }
    return false;
  }

  isAnyPlanSelected(){
    for(PlanSubscriptionModel planSubscriptionModel in planSubscriptionList){
      if(planSubscriptionModel.isActive.value){
        return true;
      }
    }
    return false;
  }

  //RxBool check = false.obs;
  //RxBool check1 = false.obs;
}

// class PlanAndSubscriptionModel {
//   final String? image;
//   final String? titleText;
//   final List<String>? descriptionList;
//   PlanAndSubscriptionModel({
//     this.titleText,
//     this.image,
//     this.descriptionList,
//   });
// }
//
// List<PlanAndSubscriptionModel> planAndSubscriptionModel = [
//   PlanAndSubscriptionModel(
//     image: "",
//     titleText: "Free plan",
//     descriptionList: [
//       "Self assess your home",
//       "Seasonal examination",
//       "Checklist",
//     ],
//   ),
//   PlanAndSubscriptionModel(
//     image: "",
//     titleText: "Monthly / Yearly subscription",
//     descriptionList: [
//       "Hire us to assess your home",
//       "Account manager",
//       "Provide home data & history",
//     ],
//   ),
// ];
