import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/colors.dart';
import '../utils/math_utils.dart';

class CommonImageView extends StatelessWidget {
  final String image;
  const CommonImageView({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getSize(24),
      width: getSize(24),
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.5,
          color: Color(0xFFAE6902),
        ),
        borderRadius: BorderRadius.circular(6),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.4, 0.8),
          //stops: [0, 0, 0, 1],
          colors: [
            ColorConstants.summerGradient1,
            ColorConstants.summerGradient2,
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(3.0),
        child: SvgPicture.asset(
          image,
          //SvgImageConstants.summer,
          // height: 18,
        ),
      ),
    );
  }
}
