import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/shared/constants/png_image_constant.dart';
import 'package:home_yogi_flutter/shared/shared.dart';
import 'package:home_yogi_flutter/shared/widgets/base_elevated_button.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';
import 'package:home_yogi_flutter/shared/widgets/common_app_bar.dart';
import 'package:home_yogi_flutter/shared/widgets/common_container_shadow.dart';

import '../../../../../../shared/dialog/email_verify_dialog.dart';
import '../../../../../../shared/dialog/share_experience_dialog.dart';
import '../../../../../../shared/utils/math_utils.dart';
import 'account_manager_controller.dart';

class AccountManagerView extends GetView<AccountManagerController> {
  const AccountManagerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: "Account Manager",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonContainerWithShadow(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Image.asset(
                      PngImageConstants.manager,
                      height: getSize(84),
                      width: getSize(84),
                    ),
                    SizedBox(
                      width: getSize(20),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BaseText(
                          text: "Your Account Manager",
                          fontSize: 10,
                          textColor: ColorConstants.white.withOpacity(0.7),
                        ),
                        SizedBox(
                          height: getSize(4),
                        ),
                        Row(
                          children: [
                            BaseText(
                              text: "Smith Willson",
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              width: getSize(4),
                            ),
                            Image.asset(
                              PngImageConstants.verify,
                              height: getSize(12),
                              width: getSize(12),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getSize(18),
                        ),
                        RatingBar.builder(
                          itemSize: getSize(16),
                          initialRating: 5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          glow: false,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: getSize(30),
            ),
            BaseText(
              text: "About me",
              fontSize: 14,
            ),
            SizedBox(
              height: getSize(10),
            ),
            CommonContainerWithShadow(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
                child: BaseText(
                  text:
                      "I was trained to perform home inspections \nby attending the inspection experts training institute in july of 1997.",
                  fontSize: 14,
                  lineHeight: 1.7,
                ),
              ),
            ),
            SizedBox(
              height: getSize(30),
            ),
            Center(
              child: BaseText(
                textAlign: TextAlign.center,
                text:
                    "Spring inspection Schedule on Wed,\n 25 May 2022 at 9:00 AM",
                fontSize: 14,
                textColor: ColorConstants.white.withOpacity(0.8),
              ),
            ),
            Spacer(),
            BaseElevatedButton(
              width: Get.width,
              onPressed: () {
                showCouponDialog();
              },
              child: BaseText(
                text: "Rate your previous inspection experience.",
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: getSize(10),
            ),
            CommonContainerWithShadow(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Column(
                  children: [
                    Image.asset(
                      PngImageConstants.voice_chat,
                      height: getSize(44),
                    ),
                    SizedBox(
                      height: getSize(10),
                    ),
                    BaseText(
                      textAlign: TextAlign.center,
                      text:
                          "Send Smith a voice note if you have any questions or just want to say hello!",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: getSize(12),
                    ),
                    BaseText(
                      text: "Click here to start conversation",
                      fontSize: 10,
                      textColor: ColorConstants.progressColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showCouponDialog() {
    showDialog(
      barrierColor: Colors.black26,
      context: Get.context!,
      builder: (context) {
        return ShareExperienceDialog(
          continueCallBack: () {
            Get.back();
          },
        );
      },
    );
  }
}
