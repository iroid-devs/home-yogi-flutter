import 'package:get/get.dart';

class PlanSubscriptionModel{
  final int planId;
  final String planTitle;
  final List<String> planBenefits;
  RxBool isActive;

  PlanSubscriptionModel({required this.planId, required this.planTitle, required this.planBenefits,required this.isActive});

}