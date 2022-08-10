import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:home_yogi_flutter/api/api_repository.dart';
import 'package:home_yogi_flutter/models/response/home/check_list_response.dart';
import 'package:home_yogi_flutter/modules/main/tabs/checklist/model/checklist_model.dart';
import 'package:home_yogi_flutter/shared/constants/constants.dart';

import '../setting/edit_profile/edit_profile_controller.dart';

class CheckListController extends GetxController {
  final ApiRepository apiRepository;
  CheckListController({required this.apiRepository});
  EditProfileController editProfileController =
      Get.put(EditProfileController(repository: Get.find()));
  var title = "Task".obs;
  var checkListResponse = CheckListResponse().obs;

  List<CheckListModel> checkListModelList = [
    CheckListModel(
        image: 'checklist_all',
        titleText: StringConstants.checklistAll,
        subText: StringConstants.progress,
        percentage: 80,
        gradientBorderColor: [
          ColorConstants.gradientPinkStart,
          ColorConstants.gradientPinkEnd,
        ],
        gradientContainerColor: [
          ColorConstants.gradientPinkStart,
          ColorConstants.gradientPinkEnd,
        ]),
    CheckListModel(
        image: 'checklist_indoor',
        titleText: StringConstants.checklistIndoor,
        subText: StringConstants.progress,
        percentage: 60,
        gradientBorderColor: [
          ColorConstants.gradientPurpleStart,
          ColorConstants.gradientPurpleEnd,
        ],
        gradientContainerColor: [
          ColorConstants.gradientPurpleStart,
          ColorConstants.gradientPurpleEnd,
        ]),
    CheckListModel(
        image: 'checklist_outdoor',
        titleText: StringConstants.checklistOutdoor,
        subText: StringConstants.progress,
        percentage: 90,
        gradientBorderColor: [
          ColorConstants.gradientGreenStart,
          ColorConstants.gradientGreenEnd,
        ],
        gradientContainerColor: [
          ColorConstants.gradientGreenStart,
          ColorConstants.gradientGreenEnd,
        ]),
  ];

  getCheckList() async {
    var res = await apiRepository.getCheckList();
    if (res != null) {
      checkListResponse.value = res;
    }
    print(
        "checkListResponse===============${checkListResponse.value.currentSeason}");
    print(
        "checkListResponse===============${(checkListResponse.value.checklists?[1].totalCompletedChecklists ?? 0) / (checkListResponse.value.checklists?[1].totalChecklists ?? 0)}%");
    print(
        "checkListResponse===============${checkListResponse.value.currentSeason.toString()}");
    print(
        "checkListResponse===============${checkListResponse.value.checklists?[0].iconImage ?? ""}");
  }

  @override
  void onInit() {
    getCheckList();
    super.onInit();
  }
}
