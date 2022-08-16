import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/checklist/category/model/subtask.dart';
import 'package:home_yogi_flutter/shared/constants/gradiant_color.dart';

import '../../../../../api/api_repository.dart';
import '../../../../../models/response/home/check_list_details_response.dart';
import 'model/task.dart';

class CheckListCategoryController extends GetxController {
  final ApiRepository apiRepository;
  CheckListCategoryController({required this.apiRepository});

  var checkListDetailsResponse = CheckListDetailsResponse().obs;

  final RxBool customTileExpanded = false.obs;
  int gradiantColorIndex = -1;
  /* List<SubTask> subTasksList = [
    SubTask('Rearrange sofas, ottomans.'),
    SubTask('Clean away electric cords, toys, and other.'),
    SubTask('Replace light globes if needed'),
  ].obs;*/

  // List<Task> taskList = [
  //   Task(
  //     title: 'Living Room',
  //     subTaskList: [
  //       SubTask('Rearrange sofas, ottomans.'),
  //       SubTask('Clean away electric cords, toys, and other.'),
  //       SubTask('Replace light globes if needed'),
  //     ],
  //   ),
  //   Task(
  //     title: 'Roof',
  //     subTaskList: [
  //       SubTask('Roof sub task-1'),
  //       SubTask('Roof sub task-2'),
  //       SubTask('Roof sub task-3'),
  //       SubTask('Roof sub task-4'),
  //     ],
  //   ),
  //   Task(
  //     title: 'Garden',
  //     subTaskList: [
  //       SubTask('Garden sub task-1'),
  //       SubTask('Garden sub task-2'),
  //       SubTask('Garden sub task-3'),
  //     ],
  //   ),
  //   Task(
  //     title: 'Bedroom',
  //     subTaskList: [
  //       SubTask('Bedroom sub task-1'),
  //       SubTask('Bedroom sub task-2'),
  //       SubTask('Bedroom sub task-3'),
  //     ],
  //   ),
  //   Task(
  //     title: 'Paint',
  //     subTaskList: [
  //       SubTask('Paint sub task-1'),
  //       SubTask('Paint sub task-2'),
  //       SubTask('Paint sub task-3'),
  //     ],
  //   ),
  // ].obs;

  changeView(ChecklistOptions subTask) {
    subTask.isChecked.toggle();
  }

  bool checkTaskCompleted(List<ChecklistOptions> subTaskList) {
    for (ChecklistOptions subTask in subTaskList) {
      if (!subTask.isChecked.value) {
        return false;
      }
    }
    return true;
  }

  incrementGradiantColorIndex() {
    gradiantColorIndex =
        (gradiantColorIndex == GradientColor().colorsList.length - 1)
            ? 0
            : ++gradiantColorIndex;
  }

  getCheckListDetails() async {
    var res = await apiRepository.getCheckListDetails(
        queryParameter: {
          'category' :  "1",
                  }
    );
    if (res != null) {
      checkListDetailsResponse.value = res;
    }
    // print(
    //     "checkListResponse===============${checkListDetailsResponse.value.onGoingChecklists![0].name}");
  }

  getCheckListChecked(int id) async {
    var get = await apiRepository.checklistChecked({}, id);

    print("checked ===========${get?.dioMessage}");
  }

  @override
  void onInit() {
    getCheckListDetails();
    //getCheckListChecked(4);
    super.onInit();
  }
}
