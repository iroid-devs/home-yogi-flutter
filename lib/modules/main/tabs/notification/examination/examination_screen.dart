// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:gradient_borders/box_borders/gradient_box_border.dart';
// import 'package:home_yogi_flutter/shared/utils/math_utils.dart';
// import 'package:home_yogi_flutter/shared/widgets/base_text.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';
//
// import '../../../../../shared/constants/colors.dart';
// import '../../../../../shared/constants/png_image_constant.dart';
// import '../../../../../shared/constants/svg_image_constant.dart';
// import '../../../../../shared/widgets/common_app_bar.dart';
// import '../../../../../shared/widgets/common_container_shadow.dart';
// import '../../../../../shared/widgets/show_coin.dart';
// import '../examination_detail_screen/examination_detail_binding.dart';
// import '../examination_detail_screen/examination_details_screen.dart';
// import '../model/examination_model.dart';
//
// class ExaminationView extends StatelessWidget {
//   ExaminationView({Key? key}) : super(key: key);
//   int pageIndex = 0;
//   double percent = 0.0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: BaseAppBar(
//         title: 'Examinations',
//         actions: [
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 26, vertical: 16),
//             child: ShowCoin(numberText: 252,),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 30.0),
//           child: Column(
//             //shrinkWrap: true,
//             children: [
//               SizedBox(
//                 height: getSize(30),
//               ),
//               CommonContainerWithShadow(
//                 width: getSize(400),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(vertical: 14),
//                   child: Column(
//                     children: [
//                       Image.asset(
//                         PngImageConstants.smile,
//                       ),
//                       SizedBox(
//                         height: getSize(8),
//                       ),
//                       BaseText(
//                         textAlign: TextAlign.center,
//                         text:
//                             "Yor are few steps ahead to unlock \nthe rewards of level 6 ",
//                         fontWeight: FontWeight.w500,
//                         fontSize: 14,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: getSize(30),
//               ),
//               BaseText(
//                 textAlign: TextAlign.center,
//                 text: "June - August",
//                 fontWeight: FontWeight.w500,
//                 fontSize: 18,
//               ),
//               SizedBox(
//                 height: getSize(20),
//               ),
//               ListView.builder(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 // itemCount: 1,
//                 itemCount: examinationModel.length,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       Get.to(
//                         ExaminationDetailsView(),
//                         binding: ExaminationDetailsBindings(),
//                       );
//                     },
//                     child: Stack(
//                       children: [
//                         examinationModel[index].isLocked
//                             ? Padding(
//                                 padding: EdgeInsets.all(16.0),
//                                 child: Container(
//                                   alignment: Alignment.center,
//                                   child: Column(
//                                     children: [
//                                       Align(
//                                         alignment: Alignment.centerRight,
//                                         child: SvgPicture.asset(
//                                           SvgImageConstants.lock,
//                                         ),
//                                       ),
//                                       BaseText(
//                                         textAlign: TextAlign.center,
//                                         text:
//                                             "Unlock in\n September - November",
//                                         fontSize: 16,
//                                         textColor: ColorConstants.white
//                                             .withOpacity(0.5),
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               )
//                             : Container(),
//                         Opacity(
//                           opacity: examinationModel[index].isLocked ? 0.1 : 1,
//                           child: Padding(
//                             padding: EdgeInsets.only(
//                               bottom: 22,
//                             ),
//                             child: CommonContainerWithShadow(
//                               child: Padding(
//                                 padding: EdgeInsets.only(
//                                     top: 10, left: 10, bottom: 10, right: 10),
//                                 child: Row(
//                                   children: [
//                                     Expanded(
//                                       flex: 1,
//                                       child: Container(
//                                         //margin: EdgeInsets.only(top: 16, left: 16, bottom: 16, right: 16),
//                                         height: getSize(80),
//                                         //width: getSize(60),
//                                         alignment: Alignment.center,
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(
//                                               getSize(14)),
//                                           border: GradientBoxBorder(
//                                             gradient: LinearGradient(
//                                               colors: [
//                                                 Color(0xffFFC876),
//                                                 Color(0xffAE6902),
//                                               ],
//                                               begin: Alignment.topLeft,
//                                               end: Alignment.bottomRight,
//                                             ),
//                                             width: getSize(1.3),
//                                           ),
//                                           gradient: LinearGradient(
//                                             colors: [
//                                               ColorConstants.summerGradient1,
//                                               ColorConstants.summerGradient2,
//                                             ],
//                                           ),
//                                         ),
//                                         child: SvgPicture.asset(
//                                           examinationModel[index].image!,
//                                           height: getSize(36),
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: getSize(20),
//                                     ),
//                                     Expanded(
//                                       flex: 3,
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           BaseText(
//                                             text: examinationModel[index]
//                                                 .titleText
//                                                 .toString(),
//                                             fontSize: 20,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                           SizedBox(
//                                             height: getSize(28),
//                                           ),
//                                           Row(
//                                             children: [
//                                               SvgPicture.asset(
//                                                 SvgImageConstants.questions,
//                                                 // height: 18,
//                                               ),
//                                               SizedBox(
//                                                 width: getSize(8),
//                                               ),
//                                               BaseText(
//                                                 text: "Questions",
//                                                 fontWeight: FontWeight.w600,
//                                                 fontSize: 10,
//                                               ),
//                                               SizedBox(
//                                                 width: getSize(84),
//                                               ),
//                                               BaseText(
//                                                 text: "6/25 ",
//                                                 fontWeight: FontWeight.w600,
//                                                 fontSize: 10,
//                                               ),
//                                             ],
//                                           ),
//                                           SizedBox(
//                                             height: getSize(6),
//                                           ),
//                                           Row(
//                                             //mainAxisAlignment: MainAxisAlignment.start,
//                                             children: [
//                                               //CommonLinearProgressIndicator(),
//                                               LinearPercentIndicator(
//                                                 width: getSize(182),
//                                                 //animation: true,
//                                                 // lineHeight: 6.0,
//                                                 padding: EdgeInsets.zero,
//                                                 animationDuration: 2000,
//                                                 percent: 0.1,
//                                                 barRadius: Radius.circular(20),
//                                                 progressColor: ColorConstants
//                                                     .progressColor,
//                                                 backgroundColor: ColorConstants
//                                                     .progressBackGroundColor,
//                                               ),
//                                               Spacer(),
//                                               SvgPicture.asset(
//                                                 SvgImageConstants.arrowRight,
//                                                 // height: 18,
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     // Spacer(),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         // BackdropFilter(
//                         //   filter: ImageFilter.blur(
//                         //     sigmaX: 2,
//                         //     sigmaY: 2,
//                         //   ),
//                         //   child:
//                         // ),
//                       ],
//                     ),
//                   );
//                   // return Padding(
//                   //   padding: EdgeInsets.only(bottom: 22.0),
//                   //   child: Container(
//                   //     // width: getSize(315),
//                   //     // height: getSize(93),
//                   //     decoration: BoxDecoration(
//                   //       borderRadius: BorderRadius.circular(14),
//                   //       color: Colors.green,
//                   //     ),
//                   //     child: Padding(
//                   //       padding: EdgeInsets.all(10.0),
//                   //       child: Row(
//                   //         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //         children: [
//                   //           ClipRRect(
//                   //             borderRadius: BorderRadius.circular(14),
//                   //             child: Container(
//                   //               height: getSize(90),
//                   //               width: getSize(90),
//                   //               decoration: BoxDecoration(
//                   //                 border: Border.all(
//                   //                   width: 0.5,
//                   //                   color: Color(0xFFAE6902),
//                   //                 ),
//                   //                 borderRadius: BorderRadius.circular(6),
//                   //                 gradient: LinearGradient(
//                   //                   begin: Alignment.topLeft,
//                   //                   end: Alignment(0.4, 0.8),
//                   //                   //stops: [0, 0, 0, 1],
//                   //                   colors: [
//                   //                     ColorConstants.summerGradient1,
//                   //                     ColorConstants.summerGradient2,
//                   //                   ],
//                   //                 ),
//                   //               ),
//                   //               child: Padding(
//                   //                 padding: EdgeInsets.all(10.0),
//                   //                 child: SvgPicture.asset(
//                   //                   examinationModel[index].image.toString(),
//                   //                   // height: 18,
//                   //                 ),
//                   //               ),
//                   //             ),
//                   //           ),
//                   //           SizedBox(
//                   //             width: getSize(20),
//                   //           ),
//                   //           Container(
//                   //             color: Colors.red,
//                   //             child: Column(
//                   //               crossAxisAlignment: CrossAxisAlignment.start,
//                   //               children: [
//                   //                 BaseText(
//                   //                   text: examinationModel[index].titleText.toString(),
//                   //                   fontSize: 20,
//                   //                   fontWeight: FontWeight.w500,
//                   //                 ),
//                   //                 SizedBox(
//                   //                   height: getSize(24),
//                   //                 ),
//                   //                 Row(
//                   //                   children: [
//                   //                     SvgPicture.asset(
//                   //                       SvgImageConstants.questions,
//                   //                       // height: 18,
//                   //                     ),
//                   //                     SizedBox(
//                   //                       width: getSize(8),
//                   //                     ),
//                   //                     BaseText(
//                   //                       text: "Questions",
//                   //                       fontWeight: FontWeight.w600,
//                   //                       fontSize: 10,
//                   //                     ),
//                   //                     SizedBox(
//                   //                       width: getSize(60),
//                   //                     ),
//                   //                     BaseText(
//                   //                       text: "6/25 ",
//                   //                       fontWeight: FontWeight.w600,
//                   //                       fontSize: 10,
//                   //                     ),
//                   //                   ],
//                   //                 ),
//                   //                 SizedBox(
//                   //                   height: getSize(6),
//                   //                 ),
//                   //                 Row(
//                   //                   children: [
//                   //                     Container(
//                   //                       width: getSize(162),
//                   //                       height: getSize(6),
//                   //                       child: ClipRRect(
//                   //                         borderRadius: BorderRadius.all(
//                   //                           Radius.circular(20),
//                   //                         ),
//                   //                         child: LinearProgressIndicator(
//                   //                           value: progressValue(),
//                   //                           valueColor: AlwaysStoppedAnimation(
//                   //                             Color(0xFF86E2FF),
//                   //                           ),
//                   //                           backgroundColor: Color(0xFF3D4D71),
//                   //                         ),
//                   //                       ),
//                   //                     ),
//                   //                     SizedBox(
//                   //                       width: getSize(18),
//                   //                     ),
//                   //                     GestureDetector(
//                   //                       onTap: () {
//                   //                         Get.to(ExaminationDetailsScreen());
//                   //                       },
//                   //                       child: SvgPicture.asset(
//                   //                         SvgImageConstants.arrowRight,
//                   //                         // height: 18,
//                   //                       ),
//                   //                     ),
//                   //                   ],
//                   //                 ),
//                   //               ],
//                   //             ),
//                   //           ),
//                   //         ],
//                   //       ),
//                   //     ),
//                   //   ),
//                   // );
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   double progressValue() {
//     switch (pageIndex) {
//       case 0:
//         return 0.25;
//       case 1:
//         return 0.5;
//       case 2:
//         return 0.75;
//       case 3:
//         return 1;
//       default:
//         return 0;
//     }
//   }
// }
