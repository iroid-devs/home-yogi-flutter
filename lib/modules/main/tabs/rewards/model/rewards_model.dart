class RewardsModel {
  final String couponBackGroundImage;
  final String logoImage;
  final String offerText;
  final String expireDate;
  final String couponText;
  final bool isLocked;
  // 0 = Indoor 1 = Outdoor

  RewardsModel( {
    required this.couponText,
    required this.expireDate,
    required this.couponBackGroundImage,
    required this.logoImage,
    required this.offerText,
    this.isLocked = false,
  });
}