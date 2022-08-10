import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/colors.dart';
import '../constants/png_image_constant.dart';
import '../constants/svg_image_constant.dart';
import '../utils/math_utils.dart';
import '../widgets/base_elevated_button.dart';
import '../widgets/base_text.dart';
import '../widgets/input_field.dart';

class ShareExperienceDialog extends StatelessWidget {
  const ShareExperienceDialog({
    Key? key,
    required this.continueCallBack,
  }) : super(key: key);

  final VoidCallback continueCallBack;
  final double borderRadius = 25.0;

  @override
  Widget build(BuildContext context) {
    TextEditingController experienceController = TextEditingController();
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
          // padding: EdgeInsets.all(getSize(0.0)),
          decoration: BoxDecoration(
              color: ColorConstants.dialogBlack,
              borderRadius: BorderRadius.circular(
                getSize(borderRadius),
              ),
              border: Border.all(
                color: ColorConstants.dialogBorderYellow,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 25,
                  color: ColorConstants.dialogBorderYellow,
                ),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(right: getSize(16), top: getSize(16),),
                child: Align(
                  alignment: Alignment.topRight,
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
              SizedBox(
                height: getSize(50),
              ),
              BaseText(
                text: "How was your experience?",
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: getSize(33),
              ),
              RatingBar.builder(
                itemSize: getSize(42),
                initialRating: 5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                glow: false,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: ColorConstants.dialogBorderYellow,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(
                height: getSize(74),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getSize(18)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: BaseText(
                    text: "Share more about your experience",
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(
                height: getSize(10),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getSize(18)),
                child: InputTextField(
                  controller: experienceController,
                  textInputType: TextInputType.multiline,
                  maxLines: 8,
                  minLines: 5,
                ),
              ),
              SizedBox(
                height: getSize(40),
              ),
              BaseElevatedButton(
                width: getSize(175.0),
                onPressed: () {
                  continueCallBack();
                },
                borderRadius: BorderRadius.circular(15.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: BaseText(text: 'SUBMIT'),
                ),
              ),
              SizedBox(
                height: getSize(20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
