import 'package:get/get.dart';
import 'package:home_yogi_flutter/shared/constants/png_image_constant.dart';

import 'model/summary_report_model.dart';

class SummaryReportController extends GetxController {
  List<SummaryReportModel> summaryReportModel = [
    SummaryReportModel(
        recommendedText: 'Repairs recommended',
        image: PngImageConstants.summary_image1,
        conditionText: 'Average',
        titleText: 'Windows',
        problemText: 'Major',
        tipsText: 'Sealing your windows properly'),

    SummaryReportModel(
        recommendedText: 'Maintenance recommended',
        image: PngImageConstants.summary_image2,
        conditionText: 'Average',
        titleText: 'Doors',
        problemText: 'Major',
        tipsText: 'Proper fitting with new door lock'),

    SummaryReportModel(
        recommendedText: 'Repairs recommended',
        image: PngImageConstants.summary_image1,
        conditionText: 'Average',
        titleText: 'Wall',
        problemText: 'Major',
        tipsText: 'Sealing your windows properly'),
  ];
}
