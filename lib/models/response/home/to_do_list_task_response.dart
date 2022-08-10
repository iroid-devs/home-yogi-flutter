import 'package:get/get.dart';

class ToDoListTaskResponse {
  RxList<Tasks>? tasks  = <Tasks>[].obs;
  List<Tasks>? completedTasks;

  ToDoListTaskResponse({this.tasks, this.completedTasks});

  ToDoListTaskResponse.fromJson(Map<String, dynamic> json) {
    if (json['tasks'] != null) {
      tasks?.value = <Tasks>[];
      json['tasks'].forEach((v) {
        tasks!.add(Tasks.fromJson(v));
      });
    }
    if (json['completedTasks'] != null) {
      completedTasks = <Tasks>[];
      json['completedTasks'].forEach((v) {
        completedTasks!.add(Tasks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tasks != null) {
      data['tasks'] = tasks!.map((v) => v.toJson()).toList();
    }
    if (completedTasks != null) {
      data['completedTasks'] =
          completedTasks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tasks {
  int? taskId;
  String? tag;
  String? title;
  String? details;
  int? category;
  int? status;
  int? date;
  bool isExpanded = false;
  RxBool isCheck = false.obs;

  Tasks(
      {this.taskId,
        this.tag,
        this.title,
        this.details,
        this.category,
        this.status,
        this.date,
        });

  Tasks.fromJson(Map<String, dynamic> json) {
    taskId = json['taskId'];
    tag = json['tag'];
    title = json['title'];
    details = json['details'];
    category = json['category'];
    status = json['status'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['taskId'] = taskId;
    data['tag'] = tag;
    data['title'] = title;
    data['details'] = details;
    data['category'] = category;
    data['status'] = status;
    data['date'] = date;
    return data;
  }
}
