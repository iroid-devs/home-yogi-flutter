import 'package:get/get.dart';

class PlanAndBillingModel {
  final String? titleText;
  final String? subtitle;
  final String? totalAmount;
  final String? offerAmountText;
  RxBool isSelected;

  PlanAndBillingModel( {
    this.offerAmountText,
    this.subtitle,
    this.titleText,
    this.totalAmount,
   required this.isSelected,
  });
}

