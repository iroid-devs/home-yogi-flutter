import 'package:flutter/material.dart';
import 'package:home_yogi_flutter/shared/constants/constants.dart';

class PremiumServiceModel {
  final int id;
  final String image;
  final String titleText;
  final List<Color>? gradientBorderColor;
  final List<Color> gradientContainerColor;

  PremiumServiceModel({
    required this.id,
    required this.image,
    required this.titleText,
    this.gradientBorderColor,
    required this.gradientContainerColor,
  });
}

List<PremiumServiceModel> premiumServiceModelList = [
  PremiumServiceModel(
    id: 1,
    image: 'book_inspection',
    titleText: 'Book\ninspection',
    gradientContainerColor: [
      ColorConstants.bookInspectionGradientStart,
      ColorConstants.bookInspectionGradientEnd,
    ],
  ),
  PremiumServiceModel(
    id: 2,
    image: 'account_manager',
    titleText: 'Account\nmanager',
    gradientContainerColor: [
      ColorConstants.accountManagerGradientStart,
      ColorConstants.accountManagerGradientEnd,
    ],
  ),
  PremiumServiceModel(
    id: 3,
    image: 'examination_result',
    titleText: 'Examination\nresults',
    gradientContainerColor: [
      ColorConstants.examinationGradientStart,
      ColorConstants.examinationGradientEnd,
    ],
  ),
  PremiumServiceModel(
    id: 4,
    image: 'summary_report',
    titleText: 'Summary\nreport',
    gradientContainerColor: [
      ColorConstants.summaryGradientStart,
      ColorConstants.summaryGradientEnd,
    ],
  ),
];
