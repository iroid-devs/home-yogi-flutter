import 'package:get/get.dart';

class CheckListDetailsResponse {
  List<OnGoingChecklists>? onGoingChecklists;
  List<OnGoingChecklists>? completedChecklists;

  CheckListDetailsResponse({this.onGoingChecklists, this.completedChecklists});

  CheckListDetailsResponse.fromJson(Map<String, dynamic> json) {
    if (json['onGoingChecklists'] != null) {
      onGoingChecklists = <OnGoingChecklists>[];
      json['onGoingChecklists'].forEach((v) {
        onGoingChecklists!.add(new OnGoingChecklists.fromJson(v));
      });
    }
    if (json['completedChecklists'] != null) {
      completedChecklists = <OnGoingChecklists>[];
      json['completedChecklists'].forEach((v) {
        completedChecklists!.add(new OnGoingChecklists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.onGoingChecklists != null) {
      data['onGoingChecklists'] =
          this.onGoingChecklists!.map((v) => v.toJson()).toList();
    }
    if (this.completedChecklists != null) {
      data['completedChecklists'] =
          this.completedChecklists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OnGoingChecklists {
  int? checklistId;
  String? name;
  int? points;
  List<ChecklistOptions>? checklistOptions;

  OnGoingChecklists(
      {this.checklistId, this.name, this.points, this.checklistOptions});

  OnGoingChecklists.fromJson(Map<String, dynamic> json) {
    checklistId = json['checklistId'];
    name = json['name'];
    points = json['points'];
    if (json['checklistOptions'] != null) {
      checklistOptions = <ChecklistOptions>[];
      json['checklistOptions'].forEach((v) {
        checklistOptions!.add(new ChecklistOptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['checklistId'] = this.checklistId;
    data['name'] = this.name;
    data['points'] = this.points;
    if (this.checklistOptions != null) {
      data['checklistOptions'] =
          this.checklistOptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChecklistOptions {
  int? checklistOptionId;
  String? option;
  var isChecked = false.obs;

  ChecklistOptions({
    this.checklistOptionId,
    this.option,
  });

  ChecklistOptions.fromJson(Map<String, dynamic> json) {
    checklistOptionId = json['checklistOptionId'];
    option = json['option'];
    isChecked.value = json['isChecked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['checklistOptionId'] = this.checklistOptionId;
    data['option'] = this.option;
    data['isChecked'] = this.isChecked.value;
    return data;
  }
}
