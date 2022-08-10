import 'package:flutter/material.dart';

import '../utils/math_utils.dart';

class CommonLinearProgressIndicator extends StatelessWidget {
  const CommonLinearProgressIndicator({Key? key}) : super(key: key);

  final int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getSize(174),
      height: getSize(6),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        //child: LinearPercentIndicator(percent: progressValue(),),
        child: LinearProgressIndicator(
          value: progressValue(),
          valueColor: AlwaysStoppedAnimation(
            Color(0xFF86E2FF),
          ),
          backgroundColor: Color(0xFF3D4D71),
        ),
      ),
    );
  }

  double progressValue() {
    switch (pageIndex) {
      case 0:
        return 0.25;
      case 1:
        return 0.5;
      case 2:
        return 0.75;
      case 3:
        return 1;
      default:
        return 0;
    }
  }
}
