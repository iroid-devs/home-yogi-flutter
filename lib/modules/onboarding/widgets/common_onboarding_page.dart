import 'package:flutter/material.dart';
import 'package:home_yogi_flutter/shared/constants/colors.dart';
import 'package:home_yogi_flutter/shared/constants/string_constant.dart';
import 'package:home_yogi_flutter/shared/utils/math_utils.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';

class OnboardingPageWidget extends StatelessWidget {
  final String titleText;
  final String routineCount;

  const OnboardingPageWidget({
    Key? key,
    required this.titleText,
    required this.routineCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: titleText.contains(StringConstants.homeYogi)
                  ? getSize(60)
                  : getSize(45)),
          child: BaseText(
            text: titleText,
            fontSize: titleText.contains(StringConstants.homeYogi) ? 32 : 46,
            fontFamily: titleText.contains(StringConstants.homeYogi)
                ? null
                : 'Rochester',
            textColor: titleText.contains(StringConstants.homeYogi)
                ? null
                : ColorConstants.black,
            shadows: [
              Shadow(
                offset: Offset(4.0, 2.0),
                blurRadius: 3.0,
                color: Color.fromARGB(50, 0, 0, 0),
              ),
            ],
          ),
        ),
        Spacer(
          flex: 2,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getSize(50)),
          child: BaseText(
            text: titleText.contains(StringConstants.homeYogi)
                ? StringConstants.homeYogiDesc
                : "Your home has $routineCount routine tasks needing attention every ${titleText.toLowerCase()}",
            textAlign: TextAlign.center,
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(),
      ],
    );
  }
}
