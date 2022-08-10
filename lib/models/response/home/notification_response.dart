class NotificationResponse {
  int? notificationId;
  String? title;
  String? message;
  int? type;
  bool? reatAt;
  int? createdAt;

  NotificationResponse(
      {this.notificationId,
      this.title,
      this.message,
      this.type,
      this.reatAt,
      this.createdAt});

  NotificationResponse.fromJson(Map<String, dynamic> json) {
    notificationId = json['notificationId'];
    title = json['title'];
    message = json['message'];
    type = json['type'];
    reatAt = json['reatAt'] == null ? false : json['reatAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notificationId'] = this.notificationId;
    data['title'] = this.title;
    data['message'] = this.message;
    data['type'] = this.type;
    data['reatAt'] = this.reatAt;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class Meta {
  int? total;
  int? perPage;
  int? totalPage;
  int? currentPage;

  Meta({this.total, this.perPage, this.totalPage, this.currentPage});

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    perPage = json['perPage'];
    totalPage = json['totalPage'];
    currentPage = json['currentPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['perPage'] = this.perPage;
    data['totalPage'] = this.totalPage;
    data['currentPage'] = this.currentPage;
    return data;
  }
}
