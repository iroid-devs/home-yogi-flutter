import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:home_yogi_flutter/shared/utils/math_utils.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';

import '../constants/colors.dart';
import '../constants/png_image_constant.dart';

class ShowCoin extends StatelessWidget {
  final int numberText;
  const ShowCoin({Key? key,required this.numberText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26, vertical: 16),
      child: Container(
        height: 10,
        decoration: ShapeDecoration(
          color: ColorConstants.progressColor,
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
          margin: EdgeInsets.all(1.0),
          //width: getSize(66),
          height: getSize(22),
          alignment: Alignment.center,
          decoration: ShapeDecoration(
            color: Color(0XFF2A7FC2),
            shape: SmoothRectangleBorder(
              borderRadius: SmoothBorderRadius.all(
                SmoothRadius(
                  cornerRadius: getSize(14),
                  cornerSmoothing: 1,
                ),
              ),
            ),
          ),
          // decoration: BoxDecoration(
          //   color: Color(0XFF2A7FC2),
          //   borderRadius: BorderRadius.circular(10),
          //   border: Border.all(color: Color(0XFF86E2FF), width: 1),
          // ),
          child: Padding(
            padding: EdgeInsets.only(top: 4, left: 8,right: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  PngImageConstants.show_coin,
                  height: 18,
                  width: 18,
                ),
                BaseText(
                  text: numberText.toString(),
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}