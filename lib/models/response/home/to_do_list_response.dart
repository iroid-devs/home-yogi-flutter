class ToDoListResponse {
  List<OnGoingTask>? onGoingTask;
  List<TaskByTags>? taskByTags;

  ToDoListResponse({this.onGoingTask, this.taskByTags});

  ToDoListResponse.fromJson(Map<String, dynamic> json) {
    if (json['onGoingTask'] != null) {
      onGoingTask = <OnGoingTask>[];
      json['onGoingTask'].forEach((v) {
        onGoingTask!.add(OnGoingTask.fromJson(v));
      });
    }
    if (json['taskByTags'] != null) {
      taskByTags = <TaskByTags>[];
      json['taskByTags'].forEach((v) {
        taskByTags!.add(TaskByTags.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (onGoingTask != null) {
      data['onGoingTask'] = onGoingTask!.map((v) => v.toJson()).toList();
    }
    if (taskByTags != null) {
      data['taskByTags'] = taskByTags!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OnGoingTask {
  String? title;
  int? date;
  int? totalTasks;
  int? totalCompletedTasks;
  String? iconImage;

  OnGoingTask({
    this.title,
    this.date,
    this.totalTasks,
    this.totalCompletedTasks,
    this.iconImage,
  });

  OnGoingTask.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    date = json['date'];
    totalTasks = json['totalTasks'];
    totalCompletedTasks = json['totalCompletedTasks'];
    iconImage = json['iconImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['date'] = date;
    data['totalTasks'] = totalTasks;
    data['totalCompletedTasks'] = totalCompletedTasks;
    data['iconImage'] = iconImage;
    return data;
  }
}

class TaskByTags {
  int? tagId;
  String? name;
  String? iconImage;

  TaskByTags({
    this.tagId,
    this.name,
    this.iconImage,
  });

  TaskByTags.fromJson(Map<String, dynamic> json) {
    tagId = json['tagId'];
    name = json['name'];
    iconImage = json['iconImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tagId'] = tagId;
    data['name'] = name;
    data['iconImage'] = iconImage;
    return data;
  }
}
