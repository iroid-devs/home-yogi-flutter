import 'dart:ui';

class TaskCategoryModel{
  final String image;
  final String titleText;
  final String subText;
  final double percentage;
  final List<Color> gradientBorderColor;
  final List<Color> gradientContainerColor;

  TaskCategoryModel({
    required this.image,
    required this.titleText,
    required this.subText,
    required this.percentage,
    required this.gradientBorderColor,
    required this.gradientContainerColor,
  });

}