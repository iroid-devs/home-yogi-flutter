import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/shared/constants/colors.dart';
import 'package:home_yogi_flutter/shared/constants/svg_image_constant.dart';
import 'package:home_yogi_flutter/shared/widgets/common_linear_progress.dart';

import '../../../../../../../shared/utils/math_utils.dart';
import '../../../../../../../shared/widgets/base_text.dart';
import '../../../../../../../shared/widgets/common_container_shadow.dart';
import '../../../../../../../shared/widgets/gradiant_container_with_image.dart';

class CommonExaminationWidget extends StatelessWidget {
  final Widget image;
  final String titleText;
  final double? height;
  final double? width;
  final bool isLocked;
  final List<Color>? gradientBorderColor;
  final List<Color>? gradientContainerColor;
  final VoidCallback? onClickCallback;
  final String date;
  final String time;

  const CommonExaminationWidget({
    Key? key,
    required this.image,
    required this.titleText,
    this.gradientBorderColor,
    required this.gradientContainerColor,
    required this.onClickCallback,
    this.height,
    this.width,
    this.isLocked = false,
    required this.date,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(
        getSize(14),
      ),
      onTap: onClickCallback,
      child: Opacity(
        opacity:isLocked
            ? 0.5
            : 1,
        child: CommonContainerWithShadow(
          child: Padding(
            padding: EdgeInsets.only(
              left: getSize(10),
              top: getSize(10),
              bottom: getSize(10),
              right: getSize(16),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                    children: [
                      GradiantContainerWithImage(
                        height: height ?? getSize(80),
                        width: width ?? getSize(80),
                        image: image,
                        gradientBorderColor: gradientBorderColor,
                        gradientContainerColor: gradientContainerColor ?? [],
                      ),
                      SizedBox(
                        width: getSize(20),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BaseText(
                              text: titleText,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                            SizedBox(
                              height: getSize(12),
                            ),

                            BaseText(
                              text: 'Date : $date',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),

                            Row(
                              children: [
                                BaseText(
                                  text: 'Time : $time',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                                Spacer(),
                                SvgPicture.asset(
                                  SvgImageConstants.arrowRight,
                                ),
                              ],
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}