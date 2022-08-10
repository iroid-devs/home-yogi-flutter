class ExaminationQuestionResponse {
  int? questionId;
  String? title;
  String? description;
  String? tip;
  int? points;
  List<Answer>? answer;

  ExaminationQuestionResponse(
      {this.questionId,
        this.title,
        this.description,
        this.tip,
        this.points,
        this.answer});

  ExaminationQuestionResponse.fromJson(Map<String, dynamic> json) {
    questionId = json['questionId'];
    title = json['title'];
    description = json['description'];
    tip = json['tip'];
    points = json['points'];
    if (json['answer'] != null) {
      answer = <Answer>[];
      json['answer'].forEach((v) {
        answer!.add(new Answer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['questionId'] = this.questionId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['tip'] = this.tip;
    data['points'] = this.points;
    if (this.answer != null) {
      data['answer'] = this.answer!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answer {
  int? answerId;
  String? image;

  Answer({this.answerId, this.image});

  Answer.fromJson(Map<String, dynamic> json) {
    answerId = json['answerId'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answerId'] = this.answerId;
    data['image'] = this.image;
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