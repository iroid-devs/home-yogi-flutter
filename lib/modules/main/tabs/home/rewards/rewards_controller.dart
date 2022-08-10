import 'package:get/get.dart';
import 'package:home_yogi_flutter/shared/constants/png_image_constant.dart';
import 'package:home_yogi_flutter/shared/constants/svg_image_constant.dart';

import '../../../../../api/api_repository.dart';
import '../../../../../models/response/home/rewards_response.dart';
import '../../rewards/model/rewards_model.dart';
import 'package:intl/intl.dart';

class RewardsController extends GetxController {
  final ApiRepository apiRepository;
  RewardsController({required this.apiRepository});
  var rewardsResponse = <RewardsResponse>[].obs;
  final page = 1.obs;
  final perPage = 25.obs;

  List<RewardsModel> rewardsModelList = [
    RewardsModel(
      couponText: 'Home Depot',
      logoImage: PngImageConstants.discount_logo,
      offerText: '10% off',
      expireDate: '4 Jun 2022',
      couponBackGroundImage: SvgImageConstants.coupon_background,
    ),
    RewardsModel(
      couponText: 'Lowe’s',
      logoImage: PngImageConstants.discount_logo2,
      offerText: '10% off',
      expireDate: '4 Jun 2022',
      couponBackGroundImage: SvgImageConstants.coupon_background1,
    ),
    RewardsModel(
      couponText: 'Walmart',
      logoImage: PngImageConstants.discount_logo3,
      offerText: '10% off',
      expireDate: '4 Jun 2022',
      couponBackGroundImage: SvgImageConstants.coupon_background2,
    ),
    RewardsModel(
      couponText: 'Ace Hardware',
      logoImage: PngImageConstants.discount_logo4,
      offerText: '5% off',
      expireDate: '4 Jun 2022',
      couponBackGroundImage: SvgImageConstants.coupon_background3,
    ),
    RewardsModel(
      couponText: 'Lowe’s',
      logoImage: PngImageConstants.discount_logo2,
      offerText: '5% off',
      expireDate: '4 Jun 2022',
      couponBackGroundImage: SvgImageConstants.coupon_background1,
      isLocked: true,
    ),
  ].obs;

  // getFormattedDate() {
  //   final f = new DateFormat('yyyy-MM-dd hh:mm');
  //
  //   Text(DateFormat('yyyy-MM-dd hh:mm').format(new DateTime.fromMillisecondsSinceEpoch(values[index]["start_time"]*1000)));
  //
  // }

  getRewardsResponse() async {
    var res = await apiRepository.getRewards(page.value, perPage.value);
    if (res != null) {
      rewardsResponse.value = res;
    }
    print(
        "RewardsResponse===============${rewardsResponse.map((e) => e.toJson())}");
  }

  @override
  void onInit() {
    getRewardsResponse();
    super.onInit();
  }
}
