import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/home_controller.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/progress_report/progress_report_controller.dart';
import 'package:home_yogi_flutter/shared/constants/png_image_constant.dart';
import 'package:home_yogi_flutter/shared/utils/math_utils.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';
import 'package:home_yogi_flutter/shared/widgets/common_container_shadow.dart';
import 'package:home_yogi_flutter/shared/widgets/shadow_percent_indicator.dart';

import '../../../../../routes/app_pages.dart';
import '../../../../../shared/widgets/common_boxshadow.dart';

class ProgressReportWidget extends GetView<HomeController> {
  ProgressReportWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return InkWell(
        borderRadius: BorderRadius.circular(
          getSize(14),
        ),
        onTap: () {
          Get.toNamed(Routes.PROGRESS_REPORT,
              arguments: controller.progressReportResponse.value);
        },
        child: CommonContainerWithShadow(
          height: getSize(134),
          shadows: [
            CommonBoxShadow.getBlackBackgroundBoxShadow(
              Offset(5, 6),
            ),
          ],
          child: Padding(
            padding: EdgeInsets.only(right: getSize(34), left: getSize(25)),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getKeepItUpText(),
                      SizedBox(
                        height: getSize(14),
                      ),
                      getDescriptionText()
                    ],
                  ),
                ),
                // SizedBox(
                //   width: getSize(20),
                // ),
                CirclePercentIndicatorWithShadow(
                  remainingPercent: controller.progressReportResponse.value
                      .progress ?? 0,
                  totalPercent: 100,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  getKeepItUpText() {
    return Row(
      children: [
        BaseText(
          text: controller.progressReportResponse.value.message?.title ?? "",
          fontSize: 22,
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.left,
        ),
        SizedBox(
          width: getSize(12),
        ),
        // Image.asset(
        //   PngImageConstants.smile,
        //   height: getSize(22),
        // ),
      ],
    );
  }

  getDescriptionText() {
    return BaseText(
      text: controller.progressReportResponse.value.message?.description ?? "",
      textColor: Colors.white.withOpacity(0.6),
      fontWeight: FontWeight.w400,
      textAlign: TextAlign.left,
    );
  }
}
