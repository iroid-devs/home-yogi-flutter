import 'package:flutter/material.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';
import '../../../../../shared/constants/png_image_constant.dart';
import '../../../../../shared/utils/math_utils.dart';

class HomeYogiOnBoardingScreen extends StatelessWidget {
  const HomeYogiOnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Spacer(
            flex: 3,
          ),
          Center(
            child: Image.asset(
              PngImageConstants.splashHome,
              height: getSize(276),
            ),
          ),
          SizedBox(
            height: getSize(70),
          ),
          BaseText(
            textAlign: TextAlign.center,
            text: "Is your Home Healthy?",
            fontSize: 26,
            fontWeight: FontWeight.w500,
          ),
          Spacer(
            flex: 4,
          ),
        ],
      ),
    );
  }
}
