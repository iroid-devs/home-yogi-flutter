import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/auth/login/plan_subscription/model/paln_subcription_model.dart';
import 'package:home_yogi_flutter/modules/auth/login/plan_subscription/plan_subscription_controller.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/examination/examination_binding.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/home_binding.dart';
import 'package:home_yogi_flutter/modules/main/tabs/setting/plan_and_billing/plan_and_billing_view.dart';
import 'package:home_yogi_flutter/modules/main/tabs/setting/plan_and_billing/plan_and_billing_binding.dart';
import 'package:home_yogi_flutter/shared/utils/app_preference.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';

import '../../../../../../routes/app_pages.dart';
import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/constants/svg_image_constant.dart';
import '../../../../../../shared/utils/math_utils.dart';
import '../../../../../../shared/widgets/base_elevated_button.dart';
import '../../../../../../shared/widgets/common_container_shadow.dart';
import '../../../main/tabs/home/examination/examination_view.dart';

class PlanSubscriptionScreen extends GetView<PlanAndSubscriptionController> {
  const PlanSubscriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildMainBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  _buildMainBody() {
    return Padding(
      padding: EdgeInsets.only(
          right: getSize(30),
          left: getSize(30),
          top: getSize(46),
          bottom: getSize(20)),
      child: Column(
        children: [
          BaseText(
            text: "Get started",
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: getSize(50),
          ),
          BaseText(
            text: "What do you want to do first?",
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: getSize(0),
          ),
          _buildPlanSubscriptionListview(),
          Spacer(),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.MAIN);
            },
            child: BaseText(
              text: "Skip to dashboard",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              textColor: ColorConstants.white.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }

  _buildPlanSubscriptionListview() {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: controller.planSubscriptionList.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildListItem(controller.planSubscriptionList[index]);
      },
    );
  }

  _buildListItem(PlanSubscriptionModel planSubscriptionModel) {
    return Obx(() {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(
            getSize(14.0),
          ),
          onTap: () {
            controller.changePlan(planSubscriptionModel.planId);
          },
          child: CommonContainerWithShadow(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            borderGradient: planSubscriptionModel.isActive.value
                ? LinearGradient(
                    colors: [
                      ColorConstants.white,
                      ColorConstants.white.withOpacity(0),
                    ],
                    begin: Alignment(-1.0, -4.0),
                    end: Alignment(1.0, 4.0),
                  )
                : null,
            child: Column(
              children: [
                Row(
                  children: [
                    planSubscriptionModel.isActive.value
                        ? SvgPicture.asset(
                            SvgImageConstants.verify_tick_square,
                          )
                        : SvgPicture.asset(
                            SvgImageConstants.square,
                          ),
                    SizedBox(
                      width: getSize(12),
                    ),
                    BaseText(
                      text: planSubscriptionModel.planTitle,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                SizedBox(
                  height: getSize(10),
                ),
                _buildPlanBenefitsListView(planSubscriptionModel.planBenefits),
              ],
            ),
          ),
        ),
      );
    });
  }

  _buildPlanBenefitsListView(List<String> planBenefitsList) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: planBenefitsList.length,
      itemBuilder: (BuildContext context, int index) {
        return commonDotContainer(text: planBenefitsList[index]);
      },
    );
  }

  _buildBottomNavigationBar() {
    return Obx(() {
      return Opacity(
        opacity: controller.isAnyPlanSelected() ? 1.0 : 0.2,
        child: Padding(
          padding: EdgeInsets.only(right: 30, left: 30, bottom: 30),
          child: BaseElevatedButton(
            height: getSize(52),
            onPressed: controller.isAnyPlanSelected() ? () async {
                    if (controller.isFreePlanSelected()) {
                      AppPreferences().setSubscription(false);
                      Get.to(
                        ExaminationView(isFromPlanSubscriptionScreen: true,),binding: HomeBindings(),
                      );
                      // Get.toNamed(Routes.MAIN);
                      // Future.delayed(const Duration(milliseconds: 1), () {
                      //   Get.toNamed(Routes.EXAMINATION);
                      // });
                    } else {
                      Get.to(
                        PlanAndBillingScreen(
                            appBarText: 'Upgrade', fromUpgradePlan: true),
                        binding: PlanAndBillingBinding(),
                      );
                    }
                  }
                : null,
            child: BaseText(
              text: "CONTINUE",
            ),
          ),
        ),
      );
    });
  }

  commonDotContainer({required String text}) {
    return Padding(
      padding: EdgeInsets.only(left: 20, bottom: 4),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 5),
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              color: ColorConstants.white,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          SizedBox(
            width: getSize(10),
          ),
          BaseText(
            text: text,
            fontSize: 14,
            textColor: ColorConstants.white.withOpacity(0.8),
          ),
        ],
      ),
    );
  }
}
