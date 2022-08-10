import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/setting/plan_and_billing/plan_and_billing_view.dart';
import 'package:home_yogi_flutter/modules/main/tabs/setting/plan_and_billing/plan_and_billing_binding.dart';
import 'package:home_yogi_flutter/shared/constants/constants.dart';
import 'package:home_yogi_flutter/shared/constants/png_image_constant.dart';
import 'package:home_yogi_flutter/shared/constants/svg_image_constant.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';
import 'package:home_yogi_flutter/shared/widgets/gradiant_container_with_image.dart';

import '../../../../../shared/utils/math_utils.dart';
import '../../../../../shared/widgets/common_boxshadow.dart';

class UpgradeWidget extends StatelessWidget {
  const UpgradeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: getSize(103),
          width: Get.width,
          decoration: ShapeDecoration(
            shadows: [CommonBoxShadow.getUpgradeBoxShadow()],
            gradient: LinearGradient(
              colors: [
                Colors.white30,
                Colors.white,
              ],
              begin: Alignment(-1.0, -2.0),
              end: Alignment(1.0, 2.0),
            ),
            shape: SmoothRectangleBorder(
              borderRadius: SmoothBorderRadius.all(
                SmoothRadius(
                  cornerRadius: getSize(14),
                  cornerSmoothing: 1,
                ),
              ),
            ),
          ),
          child: Container(
            margin: EdgeInsets.all(getSize(1)),
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffAE7C22),
                  Color(0xffF5DF79),
                  Color(0xffAF7B25),
                  Color(0xffE6CA66),
                  Color(0xffEBD06D),
                ],

                begin: Alignment(-1.0, -2.0),
                end: Alignment(1.0, 2.0),
                // begin: Alignment.topLeft,
                // end: Alignment.bottomRight,
              ),
              shape: SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius.all(
                  SmoothRadius(
                    cornerRadius: getSize(14),
                    cornerSmoothing: 1,
                  ),
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: getSize(16),
                right: getSize(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      GradiantContainerWithImage(
                        height: getSize(73),
                        width: getSize(73),
                        image: SvgPicture.asset(
                          SvgImageConstants.upgradeHome,
                          height: getSize(46),
                        ),
                        gradientContainerColor: [
                          Color(0xffF2DB76),
                          Color(0xffAF7B25),
                        ],
                      ),
                      SizedBox(
                        width: getSize(18),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BaseText(
                            text: StringConstants.upgradeDesc,
                            fontSize: 12,
                            textColor:
                                ColorConstants.backgroundColor.withOpacity(0.8),
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: getSize(5),
                          ),
                          getDescText(StringConstants.accountManager),
                          SizedBox(
                            height: getSize(2),
                          ),
                          getDescText(StringConstants.routineExams),
                          SizedBox(
                            height: getSize(2),
                          ),
                          getDescText(StringConstants.toDoList),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
          right: getSize(10),
          bottom: getSize(2),
          child: Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton.icon(
              onPressed: () {
                Get.to(
                  PlanAndBillingScreen(
                      appBarText: 'Upgrade', fromUpgradePlan: true),
                  binding: PlanAndBillingBinding(),
                );
              },
              icon: BaseText(
                text: StringConstants.upgrade,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
              style: ElevatedButton.styleFrom(
                primary: ColorConstants.black.withOpacity(0.6),
                minimumSize: Size(getSize(0), getSize(28)),
                shadowColor: fromHex('#F3DC76'),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: fromHex('#FFEEA1')),
                  borderRadius: BorderRadius.circular(
                    getSize(20),
                  ),
                ),
              ),
              label: Image.asset(
                PngImageConstants.upgradeArrow,
                height: getSize(6),
              ),
            ),
          ),
        )
      ],
    );
  }

  Row getDescText(String text) {
    return Row(
      children: [
        Container(
          height: getSize(5),
          width: getSize(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black87.withOpacity(0.6),
          ),
        ),
        SizedBox(
          width: getSize(5),
        ),
        BaseText(
          text: text,
          fontSize: 10,
          textColor: ColorConstants.backgroundColor.withOpacity(0.6),
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
