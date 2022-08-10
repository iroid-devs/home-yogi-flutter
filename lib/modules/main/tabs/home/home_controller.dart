import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:home_yogi_flutter/api/api_repository.dart';
import 'package:home_yogi_flutter/models/response/home/examination_question_response.dart';
import 'package:home_yogi_flutter/models/response/home/examination_response.dart';
import 'package:home_yogi_flutter/models/response/home/to_do_list_response.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/todolist/models/to_do_list_model.dart';
import 'package:home_yogi_flutter/modules/main/tabs/setting/edit_profile/edit_profile_controller.dart';
import 'package:home_yogi_flutter/shared/constants/constants.dart';
import 'package:home_yogi_flutter/shared/constants/gradiant_color.dart';
import 'package:home_yogi_flutter/shared/constants/svg_image_constant.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../models/response/home/levels_response.dart';
import '../../../../models/response/home/progress_report_response.dart';
import '../../../../models/response/home/rewards_response.dart';

class HomeController extends GetxController {
  final ApiRepository apiRepository;
  HomeController({required this.apiRepository});
  var title = "Home".obs;
  var currentMonthRange = "".obs;
  var currentMonthRange1 = "".obs;
  var progressReportResponse = ProgressReportResponse().obs;
  var toDoListResponse = ToDoListResponse().obs;
  final RefreshController refreshController = RefreshController();
  var examinationResponse = <ExaminationResponse>[].obs;
  var levelsResponse = LevelsResponse().obs;
  final arguments = Get.arguments;
  var taskModel;
  int gradiantColorIndex = -1;
  EditProfileController editProfileController =
      Get.put(EditProfileController(repository: Get.find()));

  List<ToDoListModel> toDoList = [
    ToDoListModel(
      StringConstants.today,
      SvgImageConstants.today,
      50,
      10,
      [ColorConstants.todayGradient1, ColorConstants.todayGradient2],
    ),
    ToDoListModel(
      StringConstants.indoor,
      SvgImageConstants.indoor,
      60,
      10,
      [ColorConstants.indoorGradiant1, ColorConstants.indoorGradiant2],
    ),
    ToDoListModel(
      StringConstants.outdoor,
      SvgImageConstants.outdoor,
      10,
      10,
      [ColorConstants.outdoorGradiant1, ColorConstants.outdoorGradiant2],
    ),
  ].obs;

  List<String> tagList = [
    'Window',
    'Yard',
    'Door',
    'Paint',
  ];

  incrementGradiantColorIndex() {
    gradiantColorIndex =
        (gradiantColorIndex == GradientColor().colorsList.length - 1)
            ? 0
            : ++gradiantColorIndex;
  }

  getExamination() async {
    var res1 = await apiRepository.getExaminations();
    if (res1 != null && res1.isNotEmpty) {
      examinationResponse.value = res1;
    }
    currentMonthRange.value =
        ("${examinationResponse.firstWhere((element) => element.isLocked == false).startMonth ?? ""} - ${examinationResponse.firstWhere((element) => element.isLocked == false).endMonth ?? ""}");
    currentMonthRange1.value =
        ("${examinationResponse.firstWhere((element) => element.isLocked == true).startMonth ?? ""} - ${examinationResponse.firstWhere((element) => element.isLocked == true).endMonth ?? ""}");

    // for (var i = 0; i < examinationResponse.length; i++) {
    //   if (examinationResponse[i].isLocked == false) {
    //     currentMonthRange.value = examinationResponse[i].startMonth??"mjh";
    //   }
    // }
    //  // print("examinationResponse===============$examinationResponse");
    //  print("examinationResponse List===============${examinationResponse.map((e) => e.toJson())}");
  }

  getToDoList() async {
    // var res3 = await apiRepository.getToDoList();
    // if(res3 != null && res3.isNotEmpty){
    //   toDoListResponse.value = res3;
    // }
    //
    // //  ToDoListResponse? toDoListResponse  = await apiRepository.getToDoList();
    // // var res = await apiRepository.getToDoList();
    // // if(res != null && res.isNotEmpty){
    // //
    // // }
    var res3 = await apiRepository.getToDoList();
    if (res3 != null) {
      toDoListResponse.value = res3;
    }
    print("toDoListResponse===============$toDoListResponse");
    print(
        "toDoListResponse===============${toDoListResponse.value.onGoingTask?.toList()}");
  }

  getProgressReport() async {
    var res2 = await apiRepository.getProgressReport();
    if (res2 != null) {
      progressReportResponse.value = res2;
    }

    print("progressReportResponse===============$progressReportResponse");
    print(
        "progressReportResponse===============${progressReportResponse.value.points}");
  }

  getRewards() async {
    // RewardsResponse? rewardsResponse = await apiRepository.getRewards();
    // print("rewardsResponse===============$rewardsResponse");
    // print("rewardsResponse===============${rewardsResponse?.name}");
  }

  getLevel() async {
    var res = await apiRepository.getLevels();
    if (res != null) {
      levelsResponse.value = res;
    }
    print("levelsResponse===============${levelsResponse.value}");
    print(
        "levelsResponse===============${levelsResponse.value.levels?[0].level ?? ""}");
  }

  @override
  void onInit() {
    if(arguments!=null){
      int viewType = arguments['viewType'];
      if(viewType==1){
        taskModel = arguments['model'] as OnGoingTask;
        //OnGoingTask onGoingTask = taskModel;
        //title = onGoingTask.title ?? '';
       // print("taskmodelongoin.................>${taskModel}");
      }else if(viewType==2){
        taskModel = arguments['model'] as TaskByTags;
        //TaskByTags taskByTags = taskModel;
        //title = taskByTags.name ?? '';
       // print("taskmodel.................>${taskModel}");
      }
    }
    getExamination();
    //getLevel();
    getToDoList();
    getProgressReport();
    super.onInit();
  }
}
