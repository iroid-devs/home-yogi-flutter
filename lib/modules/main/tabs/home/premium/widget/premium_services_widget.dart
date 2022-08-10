import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/premium/model/premium_service_model.dart';
import 'package:home_yogi_flutter/routes/routes.dart';
import 'package:home_yogi_flutter/shared/utils/math_utils.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';
import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/constants/svg_image_constant.dart';
import '../../../../../../shared/widgets/common_boxshadow.dart';
import '../../../../../../shared/widgets/common_container_shadow.dart';
import '../../../../../../shared/widgets/gradiant_container_with_image.dart';
import '../../../setting/plan_and_billing/plan_and_billing_view.dart';
import '../../../setting/plan_and_billing/plan_and_billing_binding.dart';
import 'gradient_text.dart';

class PremiumServicesWidget extends StatelessWidget {
  const PremiumServicesWidget({Key? key, required this.premiumServiceEnable})
      : super(key: key);

  final bool premiumServiceEnable;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        premiumServiceEnable ? buildContainer() : Container(),
        _buildPremiumServiceRow(),
        SizedBox(
          height: getSize(20.0),
        ),
        _buildPremiumServiceView(),
        SizedBox(
          height: getSize(20.0),
        ),
      ],
    );
  }

  _buildPremiumServiceRow() {
    return Row(
      children: [
        BaseText(
          text: 'Premium services',
          fontWeight: FontWeight.w700,
        ),
        SizedBox(
          width: getSize(10.0),
        ),
        premiumServiceEnable
            ? Container()
            : SvgPicture.asset(
                getAssetsSVGImg('crown_premium'),
              ),
      ],
    );
  }

  _buildPremiumServiceView() {
    return GridView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: getSize(10.0),
      ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: premiumServiceModelList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: getSize(25.0),
          mainAxisSpacing: getSize(25.0),
          //mainAxisExtent: getSize(150),
          childAspectRatio: 0.9),
      itemBuilder: (BuildContext context, int index) {
        return _buildPremiumServiceCard(premiumServiceModelList[index]);
      },
    );
  }

  buildContainer() {
    return Container(
      padding: EdgeInsets.all(
        getSize(2),
      ),
      margin: EdgeInsets.only(
        bottom: getSize(30.0),
      ),
      width: Get.width,
      decoration: ShapeDecoration(
        shadows: [CommonBoxShadow.getUpgradeBoxShadow()],
        gradient: LinearGradient(
          colors: [
            Color(0xff926A25),
            Color(0xffAD9145),
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
        padding: EdgeInsets.symmetric(
          horizontal: getSize(10.0),
          vertical: getSize(14.0),
        ),
        child: Row(
          //mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SvgPicture.asset(
            //   getAssetsSVGImg('crown_paid'),
            // ),

            Image.asset(
              getAssetsPNGImg('crown_premium_gold'),
              height: getSize(24),
            ),
            SizedBox(
              width: getSize(10.0),
            ),

            GradientText(
              text: 'Premium membership'.toUpperCase(),
              fontSize: 18,
              gradient: LinearGradient(
                colors: [
                  Color(0xffFFA548),
                  Color(0xffFEDE48),
                  Color(0xffFF9900),
                  Color(0xffF0C36A),
                ],
              ),
            ),
          ],
        ),
        decoration: ShapeDecoration(
          color: ColorConstants.darkContainerBlack,
          shape: SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius.all(
              SmoothRadius(
                cornerRadius: getSize(14),
                cornerSmoothing: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildPremiumServiceCard(PremiumServiceModel premiumServiceModel) {
    return InkWell(
      borderRadius: BorderRadius.circular(
        getSize(16),
      ),
      onTap: () {
        _navigateToScreen(premiumServiceModel.id);
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          Opacity(
            opacity: premiumServiceEnable ? 1.0 : 0.4,
            child: CommonContainerWithShadow(
              cornerRadius: 16,
              padding: EdgeInsets.all(
                getSize(20.0),
              ),
              shadows: [
                CommonBoxShadow.getBlackBackgroundBoxShadow(
                  Offset(5, 6),
                ),
              ],
              child: Column(
                children: [
                  GradiantContainerWithImage(
                    borderRadius: 18,
                    height: getSize(70),
                    width: getSize(70),
                    image: SvgPicture.asset(
                      getAssetsSVGImg(premiumServiceModel.image),
                    ),
                    gradientContainerColor:
                        premiumServiceModel.gradientContainerColor,
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.0),
                    child: BaseText(
                      text: premiumServiceModel.titleText,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                      //lineHeight: getSize(18),
                    ),
                  ),
                ],
              ),
            ),
          ),
          premiumServiceEnable
              ? Container()
              : Positioned(
                  right: getSize(20),
                  top: getSize(15),
                  child: SvgPicture.asset(
                    SvgImageConstants.lock,
                  ),
                ),
          // premiumServiceEnable
          //     ? Container()
          //     : Positioned.fill(
          //         child: Align(
          //           alignment: Alignment.center,
          //           child: BaseText(text: 'Upgrade'),
          //         ),
          //       ),
        ],
      ),
    );
  }

  _navigateToScreen(int id) {
    if (premiumServiceEnable) {
      switch (id) {
        case 1:
          printInfo(info: 'Open Book Inspection screen');
          Get.toNamed(Routes.BOOK_INSPECTION);
          break;

        case 2:
          printInfo(info: 'Open Account Manager screen');
          Get.toNamed(Routes.ACCOUNT_MANAGER);
          break;

        case 3:
          printInfo(info: 'Open examination Result screen');
          Get.toNamed(Routes.EXAMINATION_RESULTS);
          break;

        case 4:
          printInfo(info: 'Open Summary report screen');
          Get.toNamed(Routes.SUMMARY_REPORT);
          break;
      }
    } else {
      Get.to(
        PlanAndBillingScreen(appBarText: 'Upgrade', fromUpgradePlan: true),
        binding: PlanAndBillingBinding(),
      );
    }
  }
}
