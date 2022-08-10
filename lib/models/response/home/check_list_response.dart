import 'dart:ui';

import '../../../shared/constants/colors.dart';

class CheckListResponse {
  String? currentSeason;
  List<Checklists>? checklists;

  CheckListResponse({this.currentSeason, this.checklists});

  CheckListResponse.fromJson(Map<String, dynamic> json) {
    currentSeason = json['currentSeason'];
    if (json['checklists'] != null) {
      checklists = <Checklists>[];
      json['checklists'].forEach((v) {
        checklists!.add(new Checklists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentSeason'] = this.currentSeason;
    if (this.checklists != null) {
      data['checklists'] = this.checklists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Checklists {
  String? title;
  int? totalChecklists;
  int? totalCompletedChecklists;
  String? iconImage;
  List<Color>? gradientContainerColor;
  List<Color>? gradientBorderColor;
  Checklists({
    this.title,
    this.totalChecklists,
    this.totalCompletedChecklists,
    this.iconImage,
    this.gradientContainerColor,
    this.gradientBorderColor,
  });

  Checklists.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    totalChecklists = json['totalChecklists'];
    totalCompletedChecklists = json['totalCompletedChecklists'];
    iconImage = json['iconImage'];
    gradientContainerColor = json['title'] == 'All'
        ? [
            ColorConstants.gradientPinkStart,
            ColorConstants.gradientPinkEnd,
          ]
        : json['title'] == 'Indoor'
            ? [
                ColorConstants.gradientPurpleStart,
                ColorConstants.gradientPurpleEnd,
              ]
            : json['title'] == 'Outdoor'
                ? [
                    ColorConstants.gradientGreenStart,
                    ColorConstants.gradientGreenEnd,
                  ]
                : [];

    gradientBorderColor = json['title'] == 'All'
        ? [
            ColorConstants.gradientPinkStart,
            ColorConstants.gradientPinkEnd,
          ]
        : json['title'] == 'Indoor'
            ? [
                ColorConstants.gradientPurpleStart,
                ColorConstants.gradientPurpleEnd,
              ]
            : json['title'] == 'Outdoor'
                ? [
                    ColorConstants.gradientGreenStart,
                    ColorConstants.gradientGreenEnd,
                  ]
                : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['totalChecklists'] = this.totalChecklists;
    data['totalCompletedChecklists'] = this.totalCompletedChecklists;
    data['iconImage'] = this.iconImage;
    return data;
  }
}
