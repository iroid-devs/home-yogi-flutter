import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/shared/constants/png_image_constant.dart';

import '../constants/colors.dart';
import '../constants/svg_image_constant.dart';
import '../utils/math_utils.dart';
import '../widgets/base_elevated_button.dart';
import '../widgets/base_text.dart';

class CouponDialog extends StatelessWidget {
  const CouponDialog({Key? key, required this.continueCallBack})
      : super(key: key);

  final VoidCallback continueCallBack;

  final double borderRadius = 25.0;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: Dialog(
        insetPadding: EdgeInsets.all(getSize(32.0)),
        elevation: 0,
        backgroundColor: Color(0xffffffff),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            getSize(borderRadius),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(getSize(0.0)),
          decoration: BoxDecoration(
              color: ColorConstants.dialogBlack,
              borderRadius: BorderRadius.circular(
                getSize(borderRadius),
              ),
              border: Border.all(
                color: Color(0XFFED7024),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 25,
                  color: Color(0XFFED7024).withOpacity(0.6),
                ),
              ]),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 18.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset(
                        PngImageConstants.close,
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                ),
                BaseText(
                  text: '10% Discount',
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.center,
                  fontSize: 28,
                ),
                SizedBox(
                  height: getSize(4.0),
                ),
                BaseText(
                  text: 'On Furniture, Hand Tools, Hardware at',
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                  fontSize: 12,
                ),
                SizedBox(
                  height: getSize(4.0),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      SvgImageConstants.coupon_dialog_background,
                      width: Get.width,
                    ),
                    Align(
                      // alignment: Alignment.center,
                      child: Image.asset(
                        PngImageConstants.discount_logo1,
                        // height: 108,
                        width: getSize(104),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getSize(4.0),
                ),
                BaseText(
                  text: 'Shop for \$100 more to avail this special coupon.',
                  fontWeight: FontWeight.w500,
                  //textAlign: TextAlign.center,
                  fontSize: 16,
                  textColor: ColorConstants.white.withOpacity(0.8),
                ),
                SizedBox(
                  height: getSize(36.0),
                ),
                Row(
                  children: [
                    BaseText(
                      text: 'COUPON CODE :',
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center,
                      fontSize: 12,
                      textColor: ColorConstants.white.withOpacity(0.7),
                    ),
                    BaseText(
                      text: ' THD04106',
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                      fontSize: 14,
                    ),
                  ],
                ),
                SizedBox(
                  height: getSize(30.0),
                ),
                BaseElevatedButton(
                  onPressed: () {
                    continueCallBack();
                  },
                  borderRadius: BorderRadius.circular(15.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: BaseText(text: 'REDEEM COUPON'),
                  ),
                ),
                SizedBox(
                  height: getSize(14.0),
                ),
                BaseText(
                  text: "Valid untill 4 Jun 2022",
                  fontSize: 10,
                  textColor: ColorConstants.white.withOpacity(0.5),
                ),
                SizedBox(
                  height: getSize(20.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
