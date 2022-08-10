import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/main_controller.dart';

import '../../../../../api/api_repository.dart';
import '../../../../../models/response/home/progress_report_response.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/constants/string_constant.dart';
import '../../checklist/model/checklist_model.dart';

class ProgressReportController extends GetxController{
  final ApiRepository apiRepository;
  ProgressReportController({required this.apiRepository});
  final args = Get.arguments as  ProgressReportResponse;
  //ProgressReportResponse? progressReportResponse ;
  List<CheckListModel> checkListModelList = [
    CheckListModel(
        image: 'examination',
        titleText: StringConstants.examination,
        subText: StringConstants.progress,
        percentage: 70,
        gradientBorderColor: [
          ColorConstants.gradientPurpleLightStart,
          ColorConstants.gradientPurpleLightEnd,
        ],
        gradientContainerColor: [
          ColorConstants.gradientPurpleLightStart,
          ColorConstants.gradientPurpleLightEnd,
        ]
    ),

    CheckListModel(
        image: 'checklist_all',
        titleText: StringConstants.checklist,
        subText: StringConstants.progress,
        percentage: 60,
        gradientBorderColor: [
          ColorConstants.gradientOrangeLightStart,
          ColorConstants.gradientOrangeLightEnd,
        ],
        gradientContainerColor: [
          ColorConstants.gradientOrangeLightStart,
          ColorConstants.gradientOrangeLightEnd,
        ]
    ),
  ];

  void goToChecklistTab(){
    Get.find<MainController>().switchTab(1);
  }


  // getProgressReport()async{
  //  // progressReportResponse = (await apiRepository.progressReport());
  //  // print("progressReportResponse===============$progressReportResponse");
  //  // print("progressReportResponse===============${progressReportResponse.data?.points}");
  //   //print("progressReportResponse===============${progressReportResponse?.data?.examination?.iconImage}");
  // }
  //
  // @override
  // void onInit() {
  //   getProgressReport();
  //   super.onInit();
  // }

}