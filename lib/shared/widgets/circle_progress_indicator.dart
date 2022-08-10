import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/shared/constants/png_image_constant.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../constants/colors.dart';
import '../utils/math_utils.dart';

class BaseCircleProgressIndicator extends StatelessWidget {
  const BaseCircleProgressIndicator({
    Key? key,
    this.radius = 30.0,
    this.percent = 0.0,
    this.lineWidth = 3.0,
    this.imageUrl,
    this.imagePath,
  }) : super(key: key);

  final double radius;
  final double percent;
  final double lineWidth;
  final String? imageUrl;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    print("imagePath..........${imagePath}");
    print("imagePath != null..........${imagePath??""}");
    print("imagePath != null..........${imagePath!.isEmpty?"Tssss":"fxbgvf"}");
    return CustomPaint(
      child: CircularPercentIndicator(
        radius: getSize(radius),
        lineWidth: getSize(lineWidth),
        percent: percent,
        backgroundColor: Colors.transparent,
        backgroundWidth: 0,
        maskFilter: MaskFilter.blur(BlurStyle.solid, 5),
        progressColor: ColorConstants.circleBlue,
        circularStrokeCap: CircularStrokeCap.round,
        animation: true,
        center: ClipRRect(
          borderRadius: BorderRadius.circular(50), // Image border
          child: SizedBox.fromSize(
            size: Size.fromRadius(getSize(radius - lineWidth + 1)),
          //   child: imagePath != null
          //       ? imagePath!.contains("http")
          //           ? Image.network(imagePath!, fit: BoxFit.cover)
          //           : Image.file(
          //               File(imagePath!),
          //               fit: BoxFit.cover,
          //             )
          //       : Image.asset(PngImageConstants.home),
          // ), // Image radius
          child: (imagePath == null || imageUrl == null)
              ? Image.asset(PngImageConstants.home, fit: BoxFit.cover)
              : imagePath!.contains("http")
              ? Image.network(imagePath!, fit: BoxFit.cover)
              //   Image.file(
              //   File(imagePath!),
              //   fit: BoxFit.cover,
              // )
              : imagePath != null
                  ? Image.file(
                      File(imagePath!),
                      fit: BoxFit.cover,
                    )
                  //Image.network(imageUrl!, fit: BoxFit.cover)
                  : Image.asset(PngImageConstants.home),),
        ),
      ),
    );
  }
}
// imagePath != null
// ? Image.file(
// File(imagePath!),
// fit: BoxFit.cover,
// )
// : imageUrl != null
// ? Image.network(imageUrl!, fit: BoxFit.cover)
// :  null,
