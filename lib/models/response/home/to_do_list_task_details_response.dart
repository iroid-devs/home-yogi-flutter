class ToDoListTaskDetailsResponse {
  int? taskId;
  String? tag;
  String? title;
  String? details;
  int? category;
  int? status;
  int? date;

  ToDoListTaskDetailsResponse(
      {this.taskId,
        this.tag,
        this.title,
        this.details,
        this.category,
        this.status,
        this.date});

  ToDoListTaskDetailsResponse.fromJson(Map<String, dynamic> json) {
    taskId = json['taskId'];
    tag = json['tag'];
    title = json['title'];
    details = json['details'];
    category = json['category'];
    status = json['status'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taskId'] = this.taskId;
    data['tag'] = this.tag;
    data['title'] = this.title;
    data['details'] = this.details;
    data['category'] = this.category;
    data['status'] = this.status;
    data['date'] = this.date;
    return data;
  }
}