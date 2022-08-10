class LevelModel {
  final String image;
  final String levelText;
  final bool isLocked;
  // 0 = Indoor 1 = Outdoor

  LevelModel({
    required this.image,
    required this.levelText,
    this.isLocked = false,
  });
}
