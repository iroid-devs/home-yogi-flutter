import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/todolist/addtask/models/task_model.dart';
import 'package:intl/intl.dart';

import '../../../../../../api/api_repository.dart';
import '../../../../../../models/response/home/to_do_list_task_details_response.dart';

class AddTaskController extends GetxController {
  final ApiRepository apiRepository;
  AddTaskController({required this.apiRepository});
  var toDoListTaskDetailsResponse = ToDoListTaskDetailsResponse().obs;
  RxString tag = 'Tags'.obs;
  final RxBool isTileExpanded = false.obs;
  int? taskId = Get.arguments;
  //var tagValue = ''.obs;
  // Rx<TextEditingController> textEditingTagController = TextEditingController().obs;
  TextEditingController textEditingTitleController = TextEditingController();
  TextEditingController textEditingDetailController = TextEditingController();
  Rx<TextEditingController> textEditingDateController =
      TextEditingController().obs;
  Rx<TextEditingController> textEditingTimeController =
      TextEditingController().obs;
  DateTime? selectedDate;
  DateTime? selectedTime;
  RxBool isInDoor = false.obs;
  RxBool isOutDoor = false.obs;

  List<String> tagList = [
    'Window',
    'Yard',
    'Door',
    'Paint',
  ];

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  radioButtonCheck({required int index}) {
    if (isInDoor.value == false && isOutDoor.value == false) {
      if (index == 0) {
        isInDoor.toggle();
      } else if (index == 1) {
        isOutDoor.toggle();
      }
    } else {
      isInDoor.toggle();
      isOutDoor.toggle();
    }
  }

  setData(ToDoListTaskDetailsResponse toDoListTaskDetailsResponse) {
    tag.value = toDoListTaskDetailsResponse.tag!;
    textEditingTitleController.text = toDoListTaskDetailsResponse.title!;
    textEditingDetailController.text = toDoListTaskDetailsResponse.details!;
    textEditingDateController.value.text = DateFormat('dd/MM/yyyy').format(
        DateTime.fromMillisecondsSinceEpoch(toDoListTaskDetailsResponse.date!));
    selectedDate =
        DateTime.fromMillisecondsSinceEpoch(toDoListTaskDetailsResponse.date!);
    selectedTime =
        DateTime.fromMillisecondsSinceEpoch(toDoListTaskDetailsResponse.date!);
    textEditingTimeController.value.text = DateFormat('hh:mm').format(
        DateTime.fromMillisecondsSinceEpoch(toDoListTaskDetailsResponse.date!));
    print("selected date/..............${selectedDate}");
    if (toDoListTaskDetailsResponse.category == 0) {
      isInDoor.value = true;
    } else if (toDoListTaskDetailsResponse.category == 1) {
      isOutDoor.value = true;
    }
  }

  validation() {
    if (textEditingDateController.value.text.toString().isEmpty) {
      return 'Please select date.';
    } else if (textEditingTimeController.value.text.toString().isEmpty) {
      return 'Please select time.';
    } else if (isInDoor.value == false && isOutDoor.value == false) {
      return 'Please select category.';
    }
    return '';
  }

  getAddTask() async {
    // printInfo(info: "selectedDate : $selectedDate    selectedTime : $selectedTime");
    // DateTime.millisecondsSinceEpoch(int.parse("${textEditingDateController}000"));
    var get = await apiRepository.addTodoListAddTask({
      "tag": tag.value,
      "title": textEditingTitleController.text,
      "details": textEditingDetailController.text,
      "category": isInDoor.value ? 0 : 1,
      "date": DateTime(selectedDate!.year, selectedDate!.month,
              selectedDate!.day, selectedTime!.hour, selectedTime!.minute)
          .millisecondsSinceEpoch,
    });
    print("get=====================================${get?.dioMessage}");
  }

  getToDoListTaskDetailsResponse(int id) async {
    var res = await apiRepository.getToDoListTaskDetails(id);
    if (res != null) {
      toDoListTaskDetailsResponse.value = res;
      setData(toDoListTaskDetailsResponse.value);
    }
    // print(
    //     "toDoListTaskDetailsResponse===============$toDoListTaskDetailsResponse");
    print(
        "toDoListTaskDetailsResponse===============${toDoListTaskDetailsResponse.value.date}");
  }

  updateTaskDetails(int id) async {
     var int = DateTime(selectedDate!.year,
         selectedDate!.month, selectedDate!.day, selectedTime!.hour, selectedTime!.minute).millisecondsSinceEpoch;
     print("int==========${int}");
  print("selectedDate =======================${DateTime(selectedDate!.year, selectedDate!.month, selectedDate!.day, selectedTime!.hour, selectedTime!.minute).millisecondsSinceEpoch}");
    var updateTask = await apiRepository.updateTask(
      id,
      ({
        "tag": tag.value,
        "title": textEditingTitleController.text,
        "details": textEditingDetailController.text,
        "category": isInDoor.value ? 0 : 1,
        "date": selectedDate != null ? DateTime(selectedDate!.year, selectedDate!.month,
                selectedDate!.day, selectedTime!.hour, selectedTime!.minute)
            .millisecondsSinceEpoch : "",
      }),
    );
    print("updateTaskData=====================${updateTask.taskId}");
  }

  @override
  void onInit() {
    //getAddTask();
    //updateTaskDetails(103);
    super.onInit();
    if (taskId != null) {
      getToDoListTaskDetailsResponse(taskId!);
    }
  }
}
