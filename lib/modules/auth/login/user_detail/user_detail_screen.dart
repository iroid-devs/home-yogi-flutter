import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_yogi_flutter/routes/routes.dart';
import 'package:home_yogi_flutter/modules/auth/login/plan_subscription/plan_subscription_binding.dart';
import 'package:home_yogi_flutter/modules/auth/login/plan_subscription/plan_subscription_screen.dart';
import 'package:home_yogi_flutter/modules/auth/login/user_detail/user_detail_controller.dart';
import 'package:home_yogi_flutter/shared/constants/constants.dart';
import '../../../../../../shared/dialog/congrats_dialog.dart';
import '../../../../../../shared/utils/math_utils.dart';
import '../../../../../../shared/widgets/base_elevated_button.dart';
import '../../../../../../shared/widgets/base_text.dart';
import '../../../../../../shared/widgets/common_container_shadow.dart';
import '../../../../../../shared/widgets/input_field.dart';

class UserDetailScreen extends GetView<UserDetailController> {
  const UserDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                right: getSize(30),
                left: getSize(30),
                top: getSize(46),
                bottom: getSize(30)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: BaseText(
                    //textAlign: TextAlign.center,
                    text: "Get started",
                    fontSize: 32,
                  ),
                ),
                SizedBox(
                  height: getSize(40),
                ),
                BaseText(
                  text: 'User Name',
                  textColor: Colors.white,
                ),
                SizedBox(
                  height: getSize(12),
                ),
                InputTextField(
                  controller: controller.userNameController,
                  hintText: 'Enter Your Name',
                  enable: true,
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      getAssetsSVGImg('profile'),
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                  onChanged: (value) {
                    controller.userNameValue.value = value;
                  },
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter username.';
                  //   }
                  //   return null;
                  // },
                ),
                SizedBox(
                  height: getSize(30),
                ),
                BaseText(
                  text: 'Address',
                  textColor: Colors.white,
                ),
                SizedBox(
                  height: getSize(12),
                ),
                InputTextField(
                  controller: controller.locationController,
                  maxLines: 2,
                  hintText: 'Mark location on map',
                  readOnly: true,
                  onTap: () async {
                    String address = await Get.toNamed(Routes.googleMap);
                    printInfo(info: "Address:$address");
                    controller.locationController.text = address;
                    controller.locationValue.value = address;
                  },
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      getAssetsSVGImg('location'),
                    ),
                  ),
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.multiline,
                  onChanged: (value) {
                    controller.locationValue.value = value;
                  },
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter address.';
                  //   }
                  //   return null;
                  // },
                ),
                SizedBox(
                  height: getSize(30),
                ),
                referralView(),
                // BaseText(
                //   text: 'Enter Referral Code',
                //   textColor: Colors.white,
                // ),
                // SizedBox(
                //   height: getSize(12),
                // ),
                // InputTextField(
                //   controller: controller.referralController,
                //   hintText: 'HY2022045',
                //   prefixIcon: Padding(
                //     padding: EdgeInsets.all(12.0),
                //     child: SvgPicture.asset(
                //       getAssetsSVGImg('crown'),
                //     ),
                //   ),
                //   textInputAction: TextInputAction.newline,
                //   textInputType: TextInputType.multiline,
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please enter valid referral code.';
                //     }
                //     return null;
                //   },
                // ),
                //Spacer(),
              ],
            ),
          ),
          physics: BouncingScrollPhysics(),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Visibility(
                visible: controller.visible.value,
                child: InkWell(
                  onTap: () {
                    controller.visible.value = false;
                  },
                  child: CommonContainerWithShadow(
                    height: getSize(56),
                    width: Get.width,
                    child: Center(
                      child: BaseText(
                        text: StringConstants.haveAReferralCode,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getSize(30),
              ),
              Opacity(
                opacity : (controller.userNameValue.value.isNotEmpty &&
                        controller.locationValue.value.isNotEmpty)
                    ? 1
                    : 0.2,
                child: BaseElevatedButton(
                  height: getSize(52),
                  onPressed: (controller.userNameValue.value.isNotEmpty &&
                      controller.locationValue.value.isNotEmpty) ? () {

                    controller.updateUserDetails();

                  }:null,
                  child: BaseText(
                    text: StringConstants.continued.toUpperCase(),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  referralView() {
    return Visibility(
      visible: !controller.visible.value,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseText(
            text: 'Enter Referral Code',
            textColor: Colors.white,
          ),
          SizedBox(
            height: getSize(12),
          ),
          InputTextField(
            controller: controller.referralController,
            hintText: 'HY2022045',
            prefixIcon: Padding(
              padding: EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                getAssetsSVGImg('crown'),
              ),
            ),
            textInputAction: TextInputAction.done,
            onChanged: (value) {
              controller.referralValue.value = value;
            },
          ),
        ],
      ),
    );
  }
}
