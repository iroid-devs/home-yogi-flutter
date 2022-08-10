import 'package:flutter/material.dart';
import 'package:home_yogi_flutter/di.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/home_controller.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/rewards/rewards_screen.dart';

import 'package:home_yogi_flutter/modules/main/tabs/home/rewards/rewards_binding.dart';
import 'package:home_yogi_flutter/routes/routes.dart';

import 'package:home_yogi_flutter/shared/constants/png_image_constant.dart';
import 'package:home_yogi_flutter/shared/utils/math_utils.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';
import 'package:home_yogi_flutter/shared/widgets/circle_progress_indicator.dart';
import 'package:home_yogi_flutter/shared/widgets/common_boxshadow.dart';

class HomeAppbarWidget extends GetView<HomeController> {
  const HomeAppbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(getSize(20)),
              onTap: () {
               // Get.toNamed(Routes.LEVEL);
              },
              child: BaseCircleProgressIndicator(
                radius: 20,
                lineWidth: 3.5,
                percent: 0.75,
                imagePath: controller.editProfileController.pickedImagePath.value,
                imageUrl: DenpendencyInjection.userResponse.profileImage,
              ),
            ),
            SizedBox(
              width: getSize(10),
            ),
            GestureDetector(
              //borderRadius: BorderRadius.circular(getSize(20)),
              onTap: () {
              //  Get.toNamed(Routes.LEVEL);
              },
              child: BaseText(
                text: "5 Level",
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(getSize(20)),
              onTap: () {
                controller.getLevel();
                Get.toNamed(Routes.LEVEL);
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    CommonBoxShadow.getLevelBadgeBoxShadow(),
                  ],
                ),
                child: Image.asset(
                  PngImageConstants.level_badge,
                  height: getSize(37),
                  width: getSize(42),
                ),
              ),
            ),
            Spacer(),
            InkWell(
              borderRadius: BorderRadius.circular(getSize(8)),
              onTap: () {
                Get.to(
                  RewardsScreen(),
                  binding: RewardsBinding(),
                );
              },
              child: Image.asset(
                PngImageConstants.gift,
                height: getSize(34),
                width: getSize(34),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
