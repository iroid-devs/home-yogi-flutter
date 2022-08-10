import 'package:flutter/material.dart';
import 'package:home_yogi_flutter/shared/utils/math_utils.dart';
import 'package:home_yogi_flutter/shared/widgets/common_container_shadow.dart';

import '../../../../../shared/widgets/common_container_shadow.dart';

import '../../../../../shared/widgets/common_boxshadow.dart';

@override
Widget build(BuildContext context) {
  return CommonContainerWithShadow(
    shadows: [
      CommonBoxShadow.getBlackBackgroundBoxShadow(
        Offset(5, 6),
      ),
    ],
    height: getSize(80),
    width: getSize(200),
    // containerGradiantList: [
    //   Color.fromRGBO(255, 255, 255, 0.1),
    //   Color.fromRGBO(255, 255, 255, 0),
    //   Color.fromRGBO(255, 255, 255, 0),
    // ],
    child: Container(),
  );
}
