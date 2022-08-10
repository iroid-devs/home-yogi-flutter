import 'dart:ui';

class CheckListModel{
  final String image;
  final String titleText;
  final String subText;
  final double percentage;
  final List<Color> gradientBorderColor;
  final List<Color> gradientContainerColor;

  CheckListModel({
    required this.image,
    required this.titleText,
    required this.subText,
    required this.percentage,
    required this.gradientBorderColor,
    required this.gradientContainerColor,
  });

}