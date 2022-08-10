class ProgressReportResponse {
  int? progress;
  Message? message;
  int? points;
  List<Report>? report;

  ProgressReportResponse({this.progress, this.message, this.points, this.report});

  ProgressReportResponse.fromJson(Map<String, dynamic> json) {
    progress = json['progress'];
    message =
    json['message'] != null ? new Message.fromJson(json['message']) : null;
    points = json['points'];
    if (json['report'] != null) {
      report = <Report>[];
      json['report'].forEach((v) {
        report!.add(new Report.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['progress'] = this.progress;
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    data['points'] = this.points;
    if (this.report != null) {
      data['report'] = this.report!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Message {
  String? title;
  String? description;

  Message({this.title, this.description});

  Message.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}

class Report {
  String? title;
  int? progress;
  String? iconImage;

  Report({this.title, this.progress, this.iconImage});

  Report.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    progress = json['progress'];
    iconImage = json['iconImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['progress'] = this.progress;
    data['iconImage'] = this.iconImage;
    return data;
  }
}