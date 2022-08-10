import 'dart:ui';

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:home_yogi_flutter/shared/constants/constants.dart';
import 'package:home_yogi_flutter/shared/widgets/common_container_shadow.dart';

import '../constants/png_image_constant.dart';
import '../utils/math_utils.dart';
import '../widgets/base_elevated_button.dart';
import '../widgets/base_text.dart';

class LevelDialog extends StatelessWidget {
  const LevelDialog(
      {Key? key, required this.continueCallBack, required this.image, required this.levelText})
      : super(key: key);

  final VoidCallback continueCallBack;
  final String image;
  final String levelText;
  final double borderRadius = 20.0;
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: Dialog(
        insetPadding: EdgeInsets.all(getSize(30.0)),
        elevation: 0,
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius.all(
            SmoothRadius(
              cornerSmoothing: 1,
              cornerRadius: getSize(borderRadius),
            ),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(getSize(0.0)),
          decoration: ShapeDecoration(
            color: ColorConstants.dialogBlack,
            shadows: [
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 30,
                color: Color.fromRGBO(255, 122, 122, 0.6),
              ),
            ],
            shape: SmoothRectangleBorder(
              side: BorderSide(
                color: ColorConstants.red4,
              ),
              borderRadius: SmoothBorderRadius.all(
                SmoothRadius(
                  cornerRadius: getSize(borderRadius),
                  cornerSmoothing: 1,
                ),
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Opacity(
                    opacity: 0.2,
                    child: Image.asset(
                      PngImageConstants.level_dialog_background,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: getSize(24),
                      ),
                      BaseText(
                        text: "Congrats, John !",
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                      SizedBox(
                        height: getSize(20),
                      ),
                      Image.network(
                        image,
                          height: getSize(117),
                          width: getSize(128),
                      ),
                      // Image.asset(
                      //   image,
                      //   height: getSize(117),
                      //   width: getSize(128),
                      // ),
                      SizedBox(
                        height: getSize(20),
                      ),
                      BaseText(
                        text:"${levelText} Level",
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: getSize(10),
              ),
              BaseText(
                text: "You just unlocked a new badge and Rewards !",
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: getSize(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          PngImageConstants.coin_without_shadow,
                          height: getSize(30),
                          width: getSize(30),
                        ),
                        SizedBox(
                          height: getSize(3),
                        ),
                        BaseText(
                          text: "+25",
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: getSize(50),
                    ),
                    SizedBox(
                      height: getSize(53),
                      child: VerticalDivider(
                        width: 1,
                        color: ColorConstants.white.withOpacity(0.2),
                      ),
                    ),
                    SizedBox(
                      width: getSize(50),
                    ),
                    Column(
                      children: [
                        Image.asset(
                          PngImageConstants.reward_coupon,
                          height: getSize(24),
                          width: getSize(24),
                        ),
                        SizedBox(
                          height: getSize(3),
                        ),
                        BaseText(
                          text: "+3",
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              BaseText(
                textAlign: TextAlign.center,
                text:
                    "Thanks for being such an\n active member in our\n community !",
                fontSize: 12,
                textColor: ColorConstants.white.withOpacity(0.6),
              ),
              SizedBox(
                height: getSize(20),
              ),
              BaseElevatedButton(
                width: getSize(175),
                onPressed: continueCallBack,
                child: BaseText(
                  text: StringConstants.continued.toUpperCase(),
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: getSize(20),
              ),
              CommonContainerWithShadow(
                height: getSize(33),
                width: getSize(200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BaseText(
                      text: "Share with Friends",
                      fontSize: 12,
                    ),
                    SizedBox(
                      width: getSize(20),
                    ),
                    Image.asset(
                      PngImageConstants.coin_without_shadow,
                    ),
                    BaseText(
                      text: "+10",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getSize(30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
