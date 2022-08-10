import 'package:flutter/material.dart';
import 'package:home_yogi_flutter/shared/constants/colors.dart';

class ExaminationResponse {
  int? examinationId;
  String? name;
  String? description;
  String? startMonth;
  String? endMonth;
  int? totalQuestions;
  int? totalAnswered;
  bool? isLocked;
  String? iconImage;
  List<Color>? gradientContainerColor;
  ExaminationResponse({
    this.examinationId,
    this.name,
    this.description,
    this.startMonth,
    this.endMonth,
    this.totalQuestions,
    this.totalAnswered,
    this.isLocked,
    this.iconImage,
    this.gradientContainerColor,
  });

  ExaminationResponse.fromJson(Map<String, dynamic> json) {
    examinationId = json['examinationId'];
    name = json['name'];
    description = json['description'];
    startMonth = json['startMonth'];
    endMonth = json['endMonth'];
    totalQuestions = json['totalQuestions'];
    totalAnswered = json['totalAnswered'];
    isLocked = json['isLocked'];
    iconImage = json['iconImage'];
    gradientContainerColor = json['name'] == 'Summer'
        ? [
            ColorConstants.summerGradient1,
            ColorConstants.summerGradient2,
          ]
        : json['name'] == 'Winter'
            ? [
                ColorConstants.winterGradiant1,
                ColorConstants.winterGradiant2,
              ]
            : json['name'] == 'Spring'
                ? [
                    ColorConstants.springGradiant1,
                    ColorConstants.springlGradiant2,
                  ]
                : json['name'] == 'Fall'
                    ? [
                        ColorConstants.fallGradiant1,
                        ColorConstants.fallGradiant2,
                      ]
                    : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['examinationId'] = examinationId;
    data['name'] = name;
    data['description'] = description;
    data['startMonth'] = startMonth;
    data['endMonth'] = endMonth;
    data['totalQuestions'] = totalQuestions;
    data['totalAnswered'] = totalAnswered;
    data['isLocked'] = isLocked;
    data['iconImage'] = iconImage;
    return data;
  }
}
