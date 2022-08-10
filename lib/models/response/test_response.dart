class TestModel {
  List<Data>? data;
  Links? links;
  Meta? meta;

  TestModel({this.data, this.links, this.meta});

  TestModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Data {
  int? leaveId;
  int? userId;
  String? name;
  int? startDate;
  int? endDate;
  double? days;
  String? reason;
  int? isUrgent;
  int? status;
  String? projectName;
  String? penddingWork;
  String? helpingHand;

  Data(
      {this.leaveId,
      this.userId,
      this.name,
      this.startDate,
      this.endDate,
      this.days,
      this.reason,
      this.isUrgent,
      this.status,
      this.projectName,
      this.penddingWork,
      this.helpingHand});

  Data.fromJson(Map<String, dynamic> json) {
    leaveId = json['leave_id'];
    userId = json['user_id'];
    name = json['name'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    days = json['days'];
    reason = json['reason'];
    isUrgent = json['is_urgent'];
    status = json['status'];
    projectName = json['project_name'];
    penddingWork = json['pendding_work'];
    helpingHand = json['helping_hand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['leave_id'] = leaveId;
    data['user_id'] = userId;
    data['name'] = name;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['days'] = days;
    data['reason'] = reason;
    data['is_urgent'] = isUrgent;
    data['status'] = status;
    data['project_name'] = projectName;
    data['pendding_work'] = penddingWork;
    data['helping_hand'] = helpingHand;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<Links>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage,
      this.from,
      this.lastPage,
      this.links,
      this.path,
      this.perPage,
      this.to,
      this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['from'] = from;
    data['last_page'] = lastPage;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['path'] = path;
    data['per_page'] = perPage;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}
