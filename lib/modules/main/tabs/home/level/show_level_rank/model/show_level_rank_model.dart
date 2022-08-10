import 'package:flutter/painting.dart';
import 'package:home_yogi_flutter/shared/constants/png_image_constant.dart';

class ShowLevelRankModel {
  final String name;
  final String rank;
  final String image;
  final String coin;
  final String medal;
  final bool isCurrentUser;
  final List<Color>? colors;
  ShowLevelRankModel({
    required this.name,
    required this.rank,
    this.image = PngImageConstants.home,
    required this.coin,
    this.medal = '',
    this.isCurrentUser = false,
    this.colors,
  });
}
