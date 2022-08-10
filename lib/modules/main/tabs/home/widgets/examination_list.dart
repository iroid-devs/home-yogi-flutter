import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/examination/model/examination_model.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/home_controller.dart';
import 'package:home_yogi_flutter/shared/constants/png_image_constant.dart';
import 'package:home_yogi_flutter/shared/constants/svg_image_constant.dart';
import 'package:home_yogi_flutter/shared/utils/math_utils.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';
import 'package:home_yogi_flutter/shared/widgets/common_boxshadow.dart';
import 'package:home_yogi_flutter/shared/widgets/common_container_shadow.dart';
import 'package:home_yogi_flutter/shared/widgets/gradiant_container_with_image.dart';

import '../../../../../routes/app_pages.dart';

class ExaminationListWidget extends GetView<HomeController> {
  const ExaminationListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: controller.examinationResponse.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? getSize(24) : 0,
              right: getSize(20),
            ),
            child: Opacity(
              opacity: controller.examinationResponse[index].isLocked!
                  ? 0.2
                  : 1.0,
              child: InkWell(
                borderRadius: BorderRadius.circular(
                  getSize(14),
                ),
                onTap: controller.examinationResponse[index].isLocked!
                    ? null
                    : () {
                  Get.toNamed(Routes.QUESTION,
                      arguments: controller.examinationResponse[index]);
                },
                child: CommonContainerWithShadow(
                  shadows: [
                    CommonBoxShadow.getBlackBackgroundBoxShadow(
                      Offset(5, 6),
                    )
                  ],
                  width: getSize(200),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.only(
                          left: getSize(12),
                        ),
                        leading: GradiantContainerWithImage(
                          height: getSize(60),
                          width: getSize(60),
                          image: Image.network(
                            controller.examinationResponse[index].iconImage
                                .toString(),
                            height: getSize(28),),
                          // Image.asset(
                          //     controller.examinationResponse[index].iconImage.toString(),
                          //   height: getSize(28),
                          //  // width: getSize(28),
                          // ),

                          // SvgPicture.asset(
                          //   examinationModelList[index].image,
                          //   height:
                          //       getSize(examinationModelList[index].imageHeight),
                          //   // width:
                          //   //     getSize(examinationModel[index].imageWidth ?? 28)
                          // ),
                          // gradientBorderColor: [
                          //   Color(0xffFFC876),
                          //   Color(0xffAE6902),
                          // ],
                          gradientContainerColor: examinationModelList[index]
                              .gradientContainerColor ??
                              [],
                        ),
                        // leading: Container(
                        //   decoration: ShapeDecoration(
                        //     gradient: LinearGradient(
                        //       colors: [
                        //         Color(0xffFFC876),
                        //         Color(0xffAE6902),
                        //       ],
                        //       begin: Alignment.topLeft,
                        //       end: Alignment.bottomRight,
                        //     ),
                        //     shadows: [
                        //       CommonBoxShadow.getBlackBackgroundBoxShadow(
                        //           Offset(5, -6)),
                        //     ],
                        //     shape: SmoothRectangleBorder(
                        //       borderRadius: SmoothBorderRadius.all(
                        //         SmoothRadius(
                        //           cornerRadius: getSize(14),
                        //           cornerSmoothing: 1,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        //   child: Container(
                        //     margin: EdgeInsets.all(1),
                        //     height: getSize(60),
                        //     width: getSize(60),
                        //     alignment: Alignment.center,
                        //     decoration: ShapeDecoration(
                        //       gradient: LinearGradient(
                        //         colors: [
                        //           ColorConstants.summerGradient1,
                        //           ColorConstants.summerGradient2,
                        //         ],
                        //         begin: Alignment.topLeft,
                        //         end: Alignment.bottomRight,
                        //       ),
                        //       shape: SmoothRectangleBorder(
                        //         borderRadius: SmoothBorderRadius.all(
                        //           SmoothRadius(
                        //             cornerRadius: getSize(14),
                        //             cornerSmoothing: 1,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     child: SvgPicture.asset(
                        //       examinationModel[index].image!,
                        //       height: getSize(28),
                        //     ),
                        //   ),
                        // ),

                        title: BaseText(
                          text: controller.examinationResponse[index].name
                              .toString(),
                        ),
                      ),
                      Positioned.fill(
                        bottom: getSize(14),
                        right: getSize(14),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: SvgPicture.asset(
                            SvgImageConstants.arrowRight,
                            height: getSize(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
