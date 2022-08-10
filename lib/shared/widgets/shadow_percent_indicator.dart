import 'package:flutter/material.dart';
import 'package:home_yogi_flutter/shared/constants/colors.dart';
import 'package:home_yogi_flutter/shared/constants/png_image_constant.dart';
import 'package:home_yogi_flutter/shared/utils/math_utils.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CirclePercentIndicatorWithShadow extends StatelessWidget {
  final double totalPercent;
  final int remainingPercent;
  final double? height;
  final double? radius;
  final double? lineWigth;
  final double? centerContainerHeight;
  const CirclePercentIndicatorWithShadow({
    Key? key,
    required this.totalPercent,
    required this.remainingPercent,
    this.height,
    this.radius,
    this.lineWigth,
    this.centerContainerHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? getSize(100),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // image: DecorationImage(
        //   image: AssetImage(PngImageConstants.backEllipse),
        // ),
        color: Color.fromRGBO(255, 255, 255, 0.16),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.45),
            offset: Offset(0, 0),
            blurRadius: 14,
          ),
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.35),
            offset: Offset(0, 4),
            blurRadius: 14,
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.all(getSize(8)),
        // height: getSize(80),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color.fromRGBO(73, 73, 73, 1),
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(PngImageConstants.ellepse),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.35),
              offset: Offset(0, 0),
              blurRadius: 4,
            ),
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.45),
              offset: Offset(0, 0),
              blurRadius: 4,
            ),
          ],
        ),
        child: CircularPercentIndicator(
          circularStrokeCap: CircularStrokeCap.round,
          linearGradient: LinearGradient(
            colors: [
              Color(0xff2A7FC2),
              Color(0xff86E2FF),
            ],
            begin: Alignment(-1.0, -4.0),
            end: Alignment(1.0, 4.0),
          ),
          radius: radius ?? getSize(42),
          animation: true,
          percent: remainingPercent / totalPercent,
          lineWidth: lineWigth ?? getSize(10),
          rotateLinearGradient: true,
          backgroundColor: Colors.transparent,
          center: Container(
            height: centerContainerHeight ?? getSize(63),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ColorConstants.darkContainerBlack.withOpacity(0.4),
              shape: BoxShape.circle,
            ),
            child: BaseText(
              text: "${remainingPercent.toInt().toString()} %",
              fontSize: 22,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
