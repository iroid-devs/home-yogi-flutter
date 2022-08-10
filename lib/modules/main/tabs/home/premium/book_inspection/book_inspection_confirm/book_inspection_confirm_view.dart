import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/shared/constants/colors.dart';
import 'package:home_yogi_flutter/shared/constants/svg_image_constant.dart';
import 'package:home_yogi_flutter/shared/widgets/base_elevated_button.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';
import 'package:home_yogi_flutter/shared/widgets/common_app_bar.dart';
import 'package:home_yogi_flutter/shared/widgets/common_container_shadow.dart';

import '../../../../../../../shared/constants/png_image_constant.dart';
import '../../../../../../../shared/utils/math_utils.dart';

class BookInspectionConfirmView extends StatelessWidget {
  const BookInspectionConfirmView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: "Book inspection",
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 30.0, right: 30, bottom: 40),
        child: Column(
          children: [
            ListTile(
              leading: Image.asset(
                PngImageConstants.booking_confirm,
              ),
              title: BaseText(
                text: "Booking confirm",
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              subtitle: BaseText(
                text: "Spring inspection",
                fontWeight: FontWeight.w500,
                fontSize: 14,
                textColor: ColorConstants.white.withOpacity(0.8),
              ),
            ),
            SizedBox(
              height: getSize(30),
            ),
            BaseText(
              text: "Booked for Wed, 25 May 2022 at 9:00 AM",
              fontSize: 14,
              textColor: ColorConstants.white.withOpacity(0.8),
            ),
            SizedBox(
              height: getSize(30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  PngImageConstants.refresh_circle,
                  height: getSize(18),
                ),
                SizedBox(
                  width: getSize(6),
                ),
                BaseText(
                  text: "Reschedule",
                  fontSize: 14,
                  textColor: ColorConstants.blueShadow,
                ),
              ],
            ),
            Spacer(),
            BaseText(
              text: "Friends & Neightbours need trusted services?",
              fontSize: 12,
            ),
            SizedBox(
              height: getSize(10),
            ),
            CommonContainerWithShadow(
              height: getSize(44),
              width: Get.width,
              child: Center(
                child: BaseText(
                  text: "Share with them",
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: getSize(20),
            ),
            BaseElevatedButton(
              width: Get.width,
              onPressed: () {},
              child: BaseText(
                text: "GO TO DASHBOARD",
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
