import 'package:get/get.dart';
import 'package:home_yogi_flutter/models/response/home/to_do_list_task_details_response.dart';
import 'package:home_yogi_flutter/models/response/home/to_do_list_task_response.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/todolist/addtask/models/task_model.dart';
import '../../../../../../api/api_repository.dart';
import '../../../../../../models/response/home/to_do_list_response.dart';

class TaskCategoryController extends GetxController {
  final ApiRepository apiRepository;
  TaskCategoryController({required this.apiRepository});
  RxBool arrow = false.obs;
  RxBool check = false.obs;
  final arguments = Get.arguments;
  String title = '';
  //final toToDoListArgument = Get.arguments as OnGoingTask;
  var taskModel;
  var toDoListTaskResponse = ToDoListTaskResponse().obs;
  var toDoListTaskDetailsResponse = ToDoListTaskDetailsResponse().obs;

  // List<TaskModel> taskModelList = [
  //   TaskModel(
  //     id: 1,
  //     tag: 'Test Tag',
  //     title: 'Roof Leaks',
  //     detail: 'Test Details',
  //     date: '12/05/2022',
  //     time: '9:00 AM',
  //     category: 0,
  //   ),
  //   TaskModel(
  //     id: 2,
  //     tag: 'Test Tag',
  //     title: 'Paint',
  //     detail: 'Test Details',
  //     date: '12/05/2022',
  //     time: '10:00 AM',
  //     category: 1,
  //   ),
  //   TaskModel(
  //     id: 3,
  //     tag: 'Test Tag',
  //     title: 'Water block',
  //     detail: 'Test Details',
  //     date: '12/05/2022',
  //     time: '11:00 AM',
  //     category: 0,
  //   ),
  //   TaskModel(
  //     id: 4,
  //     tag: 'Test Tag',
  //     title: 'Repair door',
  //     detail: 'Test Details',
  //     date: '12/05/2022',
  //     time: '11:30 AM',
  //     category: 0,
  //   ),
  //   TaskModel(
  //     id: 5,
  //     tag: 'Test Tag',
  //     title: 'Cleanliness',
  //     detail: 'Test Details',
  //     date: '12/05/2022',
  //     time: '12:20 AM',
  //     category: 1,
  //   ),
  //   TaskModel(
  //     id: 6,
  //     tag: 'Test Tag',
  //     title: 'Clean yard',
  //     detail: 'Test Details',
  //     date: '12/05/2022',
  //     time: '1:00 PM',
  //     category: 1,
  //   ),
  //   TaskModel(
  //     id: 7,
  //     tag: 'Test Tag',
  //     title: 'Clean yard',
  //     detail: 'Test Details',
  //     date: '12/05/2022',
  //     time: '1:00 PM',
  //     category: 1,
  //   ),
  // ].obs;

  getToDoListTaskResponse() async {
    var res = await apiRepository.getToDoListGetTask(
        queryParameter: {
      'category' :  "1",
      'tagId' :  "4",
    }
    );
    if (res != null) {
      toDoListTaskResponse.value = res;
    }
    print("toDoListTaskResponse===============$toDoListTaskResponse");
    print("toDoListTaskResponse===============${toDoListTaskResponse.value.tasks}");
  }

  getToDoListTaskComplete(int id) async {
    var get = await apiRepository.toDoListTaskComplete(id, {});
    print("get=====================================${get?.dioMessage}");
    print(
        "get5678=====================================${toDoListTaskResponse.value.tasks![0].taskId}");
  }

  // getToDoListTaskDetailsResponse(int id) async {
  //   var res  = await apiRepository.getToDoListTaskDetails(id);
  //   if(res != null){
  //     toDoListTaskDetailsResponse.value = res;
  //   }
  //   print("toDoListTaskDetailsResponse===============$toDoListTaskDetailsResponse");
  //   print("toDoListTaskDetailsResponse===============${toDoListTaskDetailsResponse.value.title}");
  // }

   deleteTask(int id) async {
    print("iddelete${id}");
    try {
      var res = await apiRepository.deleteTask({}, id);
      print("tytytytyty......................${res}");

      toDoListTaskResponse.value.tasks?.removeWhere((element) => element.taskId == id);
      printInfo(info: 'res ==> ${toDoListTaskResponse.value.tasks?.map((element) => element.title)}');
    } catch (ex) {
      printInfo(info: 'Exception = ${ex}');
    }
  }

  @override
  void onInit() {
    if (arguments != null) {
      int viewType = arguments['viewType'];
      if (viewType == 1) {
        taskModel = arguments['model'] as OnGoingTask;

        OnGoingTask onGoingTask = taskModel;
        title = onGoingTask.title ?? '';
        print("taskmodelongoin.................>${taskModel}");
      } else if (viewType == 2) {
        taskModel = arguments['model'] as TaskByTags;
        TaskByTags taskByTags = taskModel;
        title = taskByTags.name ?? '';
        print("taskmodel.................>${taskModel}");
      }
    }
    getToDoListTaskResponse();
    //getToDoListTaskDetailsResponse(102);

    super.onInit();
  }
}