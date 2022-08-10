import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/home_controller.dart';
import 'package:home_yogi_flutter/routes/routes.dart';

import 'package:home_yogi_flutter/shared/constants/colors.dart';
import 'package:home_yogi_flutter/shared/constants/png_image_constant.dart';
import 'package:home_yogi_flutter/shared/constants/svg_image_constant.dart';
import 'package:home_yogi_flutter/shared/dialog/level_dialog.dart';
import 'package:home_yogi_flutter/shared/utils/math_utils.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';
import 'package:home_yogi_flutter/shared/widgets/common_app_bar.dart';
import 'package:home_yogi_flutter/shared/widgets/common_boxshadow.dart';
import 'package:home_yogi_flutter/shared/widgets/common_container_shadow.dart';
import 'package:home_yogi_flutter/shared/widgets/common_linear_progress.dart';

import '../../../../../../models/response/home/levels_response.dart';
import 'level_controller.dart';

class LevelScreen extends GetView<HomeController> {
  const LevelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'John Andrew',
        actions: [
          Padding(
            padding: EdgeInsets.only(right: getSize(24)),
            child: InkWell(
              borderRadius: BorderRadius.circular(getSize(20)),
              onTap: () {
                Get.toNamed(Routes.SHOW_LEVEL);
              },
              child: Image.asset(
                PngImageConstants.leader_board,
                height: getSize(32),
                width: getSize(38),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 30, left: 30, top: 30, bottom: 18),
        child: Column(
          //  shrinkWrap: true,
          // mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  SvgImageConstants.level_background,
                ),
                Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: ColorConstants.progressColor, width: 3),
                          image: DecorationImage(
                            image: AssetImage(
                              PngImageConstants.home,
                            ),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: ColorConstants.progressColor.withOpacity(
                                  0.8),
                              blurRadius: 45,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: getSize(28),
            ),
            Obx(() {
              return BaseText(
                text: "Level ${controller.levelsResponse.value
                    .userCurrentLevel}",
                fontSize: 22,
                fontWeight: FontWeight.w500,
              );
            }),
            _buildMainBody(),
            SizedBox(
              height: getSize(16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Pt 575',
                    style: TextStyle(
                        color: ColorConstants.white,
                        fontSize: getFontSize(14),
                        fontFamily: 'Readex Pro',
                        fontWeight: FontWeight.w500),
                    children: <TextSpan>[
                      TextSpan(
                        text: '/600',
                        style: TextStyle(
                          fontSize: getFontSize(14),
                          fontFamily: 'Readex Pro',
                          fontWeight: FontWeight.w500,
                          color: ColorConstants.white.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: '25 Pt ',
                    style: TextStyle(
                        color: ColorConstants.white,
                        fontSize: getFontSize(14),
                        fontFamily: 'Readex Pro',
                        fontWeight: FontWeight.w500),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'to level up',
                        style: TextStyle(
                          fontSize: getFontSize(14),
                          fontFamily: 'Readex Pro',
                          fontWeight: FontWeight.w500,
                          color: ColorConstants.white.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getSize(24),
            ),
            Expanded(
              child: CommonContainerWithShadow(
                child: Obx(() {
                  return controller.levelsResponse.value.levels != null
                      ? GridView.builder(
                    physics: BouncingScrollPhysics(),
                    primary: false,
                    padding: EdgeInsets.symmetric(
                        vertical: getSize(15), horizontal: getSize(18)),
                    shrinkWrap: true,
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: getSize(120),
                      crossAxisCount: 3,
                      crossAxisSpacing: getSize(20),
                      mainAxisSpacing: getSize(8),
                      childAspectRatio: 1,
                    ),
                    itemCount:
                    controller.levelsResponse.value.levels?.length,
                    itemBuilder: (context, index) {
                      Levels levels =
                      controller.levelsResponse.value.levels![index];
                      print("level===============$levels");
                      return InkWell(
                        onTap: controller.levelsResponse.value
                            .levels![index].isLocked!
                            ? null
                            : () {
                          showLevelDialog(
                              image: controller.levelsResponse.value
                                  .levels?[index].iconImage ??
                                  "",
                              index: index);
                        },
                        child: Column(
                          children: [
                            Opacity(
                              opacity: controller.levelsResponse.value
                                  .levels![index].isLocked!
                                  ? 0.2
                                  : 1,
                              child: CommonCircleContainerWithShadow(
                                child: Image.network(
                                  controller.levelsResponse.value
                                      .levels?[index].iconImage ??
                                      "",
                                  // color:  controller.levelsResponse.value.levels![index].isLocked! ?Colors.black : Colors.red,
                                  height: getSize(48),
                                  width: getSize(48),
                                ),
                                // Image.asset(
                                //   controller.levelsResponse.value.levels?[index].iconImage ?? "",
                                //   height: getSize(48),
                                //   width: getSize(48),
                                // ),
                                height: getSize(80),
                                width: getSize(80),
                              ),
                            ),
                            SizedBox(
                              height: getSize(10),
                            ),
                            BaseText(
                              text:
                              "Level ${controller.levelsResponse.value
                                  .levels?[index].level ?? ""}",
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      );
                    },
                  )
                      : Container();
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildMainBody() {
    return Stack(
      alignment: Alignment.center,
      children: [
        _buildLinearProgressBar(),
        Align(
          alignment: Alignment.centerLeft,
          child: _buildCircle(level: 5, bgColor: ColorConstants.progressColor),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: _buildCircle(
              level: 6, bgColor: ColorConstants.progressBackGroundColor),
        ),

        // Positioned(
        //   child: _buildCircle(level: 5, bgColor: ColorConstants.progressColor),
        //   left: 0,
        //   bottom: 5,
        // ),
        // Positioned(
        //   child: _buildCircle(
        //       level: 6, bgColor: ColorConstants.progressBackGroundColor),
        //   right: 0,
        //   bottom: 5,
        // ),
      ],
    );
  }

  _buildLinearProgressBar() {
    return CommonLinearProgressWidget(
      width: Get.width / 1.2,
      total: 600,
      remaining: 500,
      lineHeight: getSize(12),
    );
  }

  _buildCircle({required int level, required Color bgColor}) {
    return Container(
      height: getSize(40),
      width: getSize(40),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgColor,
      ),
      child: BaseText(
        textColor: bgColor == ColorConstants.progressColor
            ? ColorConstants.backgroundColor
            : null,
        text: level.toString(),
        fontSize: 22,
        shadows: [
          CommonBoxShadow.getLevelShadow(),
        ],
        fontWeight: FontWeight.w500,
      ),
    );
  }

  showLevelDialog({required String image, required int index}) {
    Get.dialog(
      LevelDialog(
        continueCallBack: () {
          Get.back();
          // ShowLevelRankScreen();
        },
        image: controller.levelsResponse.value.levels?[index].iconImage ?? "",
        levelText:
        controller.levelsResponse.value.levels?[index].level.toString() ??
            "",
      ),
    );
  }
}

// class LevelScreen extends GetView<LevelController> {
//   const LevelScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: BaseAppBar(
//         title: 'John Andrew',
//         actions: [
//           Padding(
//             padding: EdgeInsets.only(right: getSize(24)),
//             child: InkWell(
//               borderRadius: BorderRadius.circular(getSize(20)),
//               onTap: () {
//                 Get.toNamed(Routes.SHOW_LEVEL);
//               },
//               child: Image.asset(
//                 PngImageConstants.leader_board,
//                 height: getSize(32),
//                 width: getSize(38),
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: EdgeInsets.only(right: 30, left: 30, top: 30, bottom: 18),
//         child: Column(
//           //  shrinkWrap: true,
//           // mainAxisAlignment: MainAxisAlignment.center,
//           //crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Stack(
//               alignment: Alignment.center,
//               children: [
//                 SvgPicture.asset(
//                   SvgImageConstants.level_background,
//                 ),
//                 Positioned.fill(
//                     child: Align(
//                       alignment: Alignment.center,
//                       child: Container(
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(
//                               color: ColorConstants.progressColor, width: 3),
//                           image: DecorationImage(
//                             image: AssetImage(
//                               PngImageConstants.home,
//                             ),
//                           ),
//                           boxShadow: [
//                             BoxShadow(
//                               color: ColorConstants.progressColor.withOpacity(0.8),
//                               blurRadius: 45,
//                               offset: Offset(0, 0),
//                             ),
//                           ],
//                         ),
//                       ),
//                     )),
//               ],
//             ),
//             SizedBox(
//               height: getSize(28),
//             ),
//             BaseText(
//               text: "Level 5",
//               fontSize: 22,
//               fontWeight: FontWeight.w500,
//             ),
//             _buildMainBody(),
//             SizedBox(
//               height: getSize(16),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 RichText(
//                   textAlign: TextAlign.center,
//                   text: TextSpan(
//                     text: 'Pt 575',
//                     style: TextStyle(
//                         color: ColorConstants.white,
//                         fontSize: getFontSize(14),
//                         fontFamily: 'Readex Pro',
//                         fontWeight: FontWeight.w500),
//                     children: <TextSpan>[
//                       TextSpan(
//                         text: '/600',
//                         style: TextStyle(
//                           fontSize: getFontSize(14),
//                           fontFamily: 'Readex Pro',
//                           fontWeight: FontWeight.w500,
//                           color: ColorConstants.white.withOpacity(0.6),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 RichText(
//                   textAlign: TextAlign.center,
//                   text: TextSpan(
//                     text: '25 Pt ',
//                     style: TextStyle(
//                         color: ColorConstants.white,
//                         fontSize: getFontSize(14),
//                         fontFamily: 'Readex Pro',
//                         fontWeight: FontWeight.w500),
//                     children: <TextSpan>[
//                       TextSpan(
//                         text: 'to level up',
//                         style: TextStyle(
//                           fontSize: getFontSize(14),
//                           fontFamily: 'Readex Pro',
//                           fontWeight: FontWeight.w500,
//                           color: ColorConstants.white.withOpacity(0.6),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: getSize(24),
//             ),
//             Expanded(
//               child: CommonContainerWithShadow(
//                 child: GridView.builder(
//                   physics: BouncingScrollPhysics(),
//                   primary: false,
//                   padding: EdgeInsets.symmetric(
//                       vertical: getSize(15), horizontal: getSize(18)),
//                   shrinkWrap: true,
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     mainAxisExtent: getSize(120),
//                     crossAxisCount: 3,
//                     crossAxisSpacing: getSize(20),
//                     mainAxisSpacing: getSize(8),
//                     childAspectRatio: 1,
//                   ),
//                   itemCount: controller.levelModelList.length,
//                   itemBuilder: (context, index) {
//                     return InkWell(
//                       onTap: controller.levelModelList[index].isLocked
//                           ? null
//                           : () {
//                         showLevelDialog(
//                             image:
//                             controller.levelModelList[index].image);
//                       },
//                       child: Column(
//                         children: [
//                           Opacity(
//                             opacity: controller.levelModelList[index].isLocked
//                                 ? 0.2
//                                 : 1,
//                             child: CommonCircleContainerWithShadow(
//                               child: Image.asset(
//                                 controller.levelModelList[index].image,
//                                 height: getSize(48),
//                                 width: getSize(48),
//                               ),
//                               height: getSize(80),
//                               width: getSize(80),
//                             ),
//                           ),
//                           SizedBox(
//                             height: getSize(10),
//                           ),
//                           BaseText(
//                             text: controller.levelModelList[index].levelText,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   _buildMainBody() {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         _buildLinearProgressBar(),
//         Align(
//           alignment: Alignment.centerLeft,
//           child: _buildCircle(level: 5, bgColor: ColorConstants.progressColor),
//         ),
//         Align(
//           alignment: Alignment.centerRight,
//           child: _buildCircle(
//               level: 6, bgColor: ColorConstants.progressBackGroundColor),
//         ),
//
//         // Positioned(
//         //   child: _buildCircle(level: 5, bgColor: ColorConstants.progressColor),
//         //   left: 0,
//         //   bottom: 5,
//         // ),
//         // Positioned(
//         //   child: _buildCircle(
//         //       level: 6, bgColor: ColorConstants.progressBackGroundColor),
//         //   right: 0,
//         //   bottom: 5,
//         // ),
//       ],
//     );
//   }
//
//   _buildLinearProgressBar() {
//     return CommonLinearProgressWidget(
//       width: Get.width / 1.2,
//       total: 600,
//       remaining: 500,
//       lineHeight: getSize(12),
//     );
//   }
//
//   _buildCircle({required int level, required Color bgColor}) {
//     return Container(
//       height: getSize(40),
//       width: getSize(40),
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: bgColor,
//       ),
//       child: BaseText(
//         textColor: bgColor == ColorConstants.progressColor
//             ? ColorConstants.backgroundColor
//             : null,
//         text: level.toString(),
//         fontSize: 22,
//         shadows: [
//           CommonBoxShadow.getLevelShadow(),
//         ],
//         fontWeight: FontWeight.w500,
//       ),
//     );
//   }
//
//   showLevelDialog({required String image}) {
//     Get.dialog(
//       LevelDialog(
//         continueCallBack: () {
//           Get.back();
//           // ShowLevelRankScreen();
//         },
//         image: image,
//       ),
//     );
//   }
// }
