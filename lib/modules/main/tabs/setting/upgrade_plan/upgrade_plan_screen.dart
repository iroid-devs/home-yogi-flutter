import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/setting/upgrade_plan/upgrade_plan_controller.dart';
import 'package:home_yogi_flutter/shared/constants/colors.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';
import 'package:home_yogi_flutter/shared/widgets/common_app_bar.dart';
import 'package:home_yogi_flutter/shared/widgets/common_container_shadow.dart';

import '../../../../../shared/constants/svg_image_constant.dart';
import '../../../../../shared/utils/math_utils.dart';

class UpgradePlanScreen extends GetView<UpgradePlanController>{
  final bool fromUpgradePlan;
  const UpgradePlanScreen({Key? key, this.fromUpgradePlan = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Upgrade',
      ),
      body: commonPlanView(),
    );
  }

  commonPlanView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonContainerWithShadow(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 12),
                  child: Center(
                    child: BaseText(
                      text: "Features",
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10, bottom: 20),
                  child: Divider(
                    color: ColorConstants.white.withOpacity(0.1),
                  ),
                ),
                textView(text: 'Account manager'),
                textView(
                    text:
                        'Ouarterly Examination and inspection by professional inspector'),
                textView(text: 'Provide home data & history'),
                textView(text: 'Summary report'),
                textView(text: 'Free unlock discount coupons and points'),
              ],
            ),
          ),
          SizedBox(
            height: getSize(30),
          ),
          BaseText(
            text: "Select plan",
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
          SizedBox(
            height: getSize(20),
          ),
          CommonContainerWithShadow(
            child: Column(
              children: [
                ListTile(
                  title: BaseText(
                    text: "Yearly",
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                  subtitle: BaseText(
                    text: "Get 2 months free",
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                  trailing: BaseText(
                    text: "\$200",
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: getSize(20),
          ),
          CommonContainerWithShadow(
            child: Column(
              children: [
                ListTile(
                  title: BaseText(
                    text: "Quarterly",
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                  subtitle: BaseText(
                    text: "Available for 3 months",
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    textColor: ColorConstants.white.withOpacity(0.8),
                  ),
                  trailing: BaseText(
                    text: "\$80",
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  textView({required String text}) {
    return Padding(
      padding: EdgeInsets.only(right: 26, left: 15, bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            SvgImageConstants.tick,
          ),
          SizedBox(
            width: getSize(10),
          ),
          Expanded(
            child: BaseText(
              text: text,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
