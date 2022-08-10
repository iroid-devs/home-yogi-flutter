import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/models/response/home/rewards_response.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/rewards/rewards_controller.dart';
import 'package:home_yogi_flutter/shared/constants/constants.dart';
import 'package:home_yogi_flutter/shared/constants/svg_image_constant.dart';
import 'package:home_yogi_flutter/shared/utils/math_utils.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';
import 'package:home_yogi_flutter/shared/widgets/common_app_bar.dart';
import 'package:home_yogi_flutter/shared/widgets/common_container_shadow.dart';
import 'package:intl/intl.dart';

import '../../../../../shared/dialog/coupon_dialog.dart';
import '../../../../../shared/widgets/base_elevated_button.dart';
import '../../../../../shared/widgets/show_coin.dart';

// class RewardsScreen extends GetView<RewardsController> {
//   const RewardsScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: BaseAppBar(
//         title: 'Rewards',
//         actions: [
//           ShowCoin(
//             numberText: 575,
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 24),
//         child: ListView(
//           physics: BouncingScrollPhysics(),
//           children: [
//             CommonContainerWithShadow(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
//                 child: Column(
//                   children: [
//                     BaseText(
//                       textAlign: TextAlign.center,
//                       text:
//                           "Chance to win up to 50% Discount Coupon at Home Depot, Lowe’s, Walmart at only 2\$",
//                       fontWeight: FontWeight.w500,
//                       fontSize: 12,
//                     ),
//                     SizedBox(
//                       height: 8,
//                     ),
//                     BaseElevatedButton(
//                       height: getSize(24),
//                       //width: getSize(108),
//                       onPressed: () {},
//                       child: BaseText(
//                         fontSize: 10,
//                         text: 'TRY YOUR LUCK',
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             GridView.builder(
//               primary: false,
//               padding: EdgeInsets.all(20),
//               physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 //mainAxisExtent: 174,
//                 crossAxisCount: 2,
//                 crossAxisSpacing: getSize(14),
//                 mainAxisSpacing: getSize(20),
//                 childAspectRatio: 0.74,
//               ),
//               itemCount: controller.rewardsModelList.length,
//               itemBuilder: (context, index) {
//                 return InkWell(
//                   onTap: () {
//                     showCouponDialog();
//                   },
//                   child: Stack(
//                     children: [
//                       Column(
//                         // mainAxisAlignment: MainAxisAlignment.center,
//                         //crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(top: 12, right: 12),
//                             child: Align(
//                               alignment: Alignment.topRight,
//                               child: SvgPicture.asset(
//                                 SvgImageConstants.lock,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: getSize(36),
//                           ),
//                           BaseText(
//                             textAlign: TextAlign.center,
//                             text: "Required \nLevel 6",
//                             fontSize: 20,
//                             textColor: ColorConstants.white.withOpacity(0.94),
//                             fontWeight: FontWeight.w700,
//                           ),
//                           Spacer(),
//                         ],
//                       ),
//                       Opacity(
//                         opacity: controller.rewardsModelList[index].isLocked
//                             ? 0.2
//                             : 1,
//                         child: CommonContainerWithShadow(
//                           borderRadius: SmoothBorderRadius.only(
//                             bottomLeft: SmoothRadius(
//                               cornerRadius: getSize(14),
//                               cornerSmoothing: 1,
//                             ),
//                             bottomRight: SmoothRadius(
//                               cornerRadius: getSize(14),
//                               cornerSmoothing: 1,
//                             ),
//                             topLeft: SmoothRadius(
//                               cornerRadius: getSize(16),
//                               cornerSmoothing: 1,
//                             ),
//                             topRight: SmoothRadius(
//                               cornerRadius: getSize(16),
//                               cornerSmoothing: 1,
//                             ),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.stretch,
//                             children: [
//                               Stack(
//                                 alignment: Alignment.center,
//                                 children: [
//                                   SvgPicture.asset(
//                                     controller.rewardsModelList[index]
//                                         .couponBackGroundImage,
//                                     //width: Get.width,
//                                     //fit: BoxFit.cover,
//                                   ),
//                                   Positioned.fill(
//                                     child: Align(
//                                       alignment: Alignment.center,
//                                       child: Image.asset(
//                                         controller
//                                             .rewardsModelList[index].logoImage,
//                                         // height: 108,
//                                         width: getSize(64),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               // Image.asset(
//                               //   PngImageConstants.coupon_background,
//                               //   width: Get.width,
//                               //   fit: BoxFit.cover,
//                               // ),
//                               SizedBox(
//                                 height: getSize(8),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 12, vertical: 12),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         BaseText(
//                                           text: controller
//                                               .rewardsModelList[index]
//                                               .offerText,
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w700,
//                                         ),
//                                         BaseText(
//                                           text: "Free",
//                                           fontSize: 10,
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height: getSize(6),
//                                     ),
//                                     BaseText(
//                                       text: controller
//                                           .rewardsModelList[index].couponText,
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w500,
//                                       textColor:
//                                           ColorConstants.white.withOpacity(0.8),
//                                     ),
//                                     SizedBox(
//                                       height: getSize(12),
//                                     ),
//                                     Row(
//                                       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         BaseText(
//                                           text: "Expires",
//                                           fontSize: 10,
//                                           textColor: ColorConstants.white
//                                               .withOpacity(0.5),
//                                         ),
//                                         SizedBox(
//                                           width: getSize(8),
//                                         ),
//                                         BaseText(
//                                           text: controller.rewardsModelList[index].expireDate,
//                                           fontWeight: FontWeight.w500,
//                                           fontSize: 14,
//                                           textColor: ColorConstants.white
//                                               .withOpacity(0.8),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   showCouponDialog() {
//     showDialog(
//       barrierColor: Colors.black26,
//       context: Get.context!,
//       builder: (context) {
//         return CouponDialog(
//           continueCallBack: () {
//             Get.back();
//           },
//         );
//       },
//     );
//   }
// }

class RewardsScreen extends GetView<RewardsController> {
  const RewardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Rewards',
        actions: [
          ShowCoin(
            numberText: 575,
          ),
        ],
      ),
      body: Obx(() {
        print(
            "RewardsResponseFromView===============${controller.rewardsResponse.map((e) => e.toJson())}");
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              CommonContainerWithShadow(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                  child: Column(
                    children: [
                      BaseText(
                        textAlign: TextAlign.center,
                        text:
                            "Chance to win up to 50% Discount Coupon at Home Depot, Lowe’s, Walmart at only 2\$",
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      BaseElevatedButton(
                        height: getSize(24),
                        //width: getSize(108),
                        onPressed: () {},
                        child: BaseText(
                          fontSize: 10,
                          text: 'TRY YOUR LUCK',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GridView.builder(
                primary: false,
                padding: const EdgeInsets.all(15),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //mainAxisExtent: 174,
                  crossAxisCount: 2,
                  crossAxisSpacing: getSize(35),
                  mainAxisSpacing: getSize(20),
                  childAspectRatio: 0.70,
                ),
                itemCount: controller.rewardsResponse.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      showCouponDialog();
                    },
                    child: Stack(
                      children: [
                        lockCard(controller.rewardsResponse[index]),
                        // Column(
                        //   //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   //crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: [
                        //     Padding(
                        //       padding: EdgeInsets.only(top: 12, right: 12),
                        //       child: Align(
                        //         alignment: Alignment.topRight,
                        //         child: SvgPicture.asset(
                        //           SvgImageConstants.lock,
                        //         ),
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       height: getSize(36),
                        //     ),
                        //     BaseText(
                        //       textAlign: TextAlign.center,
                        //       text: "Required \nLevel 6",
                        //       fontSize: 20,
                        //       textColor: ColorConstants.white.withOpacity(0.94),
                        //       fontWeight: FontWeight.w700,
                        //     ),
                        //     //Spacer(),
                        //   ],
                        // ),
                        Opacity(
                            opacity: controller.rewardsResponse[index].isLocked!
                                ? 0.2
                                : 1,
                            child:
                                rewardsCard(controller.rewardsResponse[index])
                            // CommonContainerWithShadow(
                            //   borderRadius: SmoothBorderRadius.only(
                            //     bottomLeft: SmoothRadius(
                            //       cornerRadius: getSize(14),
                            //       cornerSmoothing: 1,
                            //     ),
                            //     bottomRight: SmoothRadius(
                            //       cornerRadius: getSize(14),
                            //       cornerSmoothing: 1,
                            //     ),
                            //     topLeft: SmoothRadius(
                            //       cornerRadius: getSize(16),
                            //       cornerSmoothing: 1,
                            //     ),
                            //     topRight: SmoothRadius(
                            //       cornerRadius: getSize(16),
                            //       cornerSmoothing: 1,
                            //     ),
                            //   ),
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.stretch,
                            //     children: [
                            //       Stack(
                            //         alignment: Alignment.center,
                            //         children: [
                            //           SvgPicture.asset(
                            //             controller.rewardsModelList[index]
                            //                 .couponBackGroundImage,
                            //             width: getSize(150),
                            //             fit: BoxFit.fitWidth,
                            //           ),
                            //           Positioned.fill(
                            //             child: Align(
                            //               alignment: Alignment.center,
                            //               child: Image.asset(
                            //                 controller
                            //                     .rewardsModelList[index].logoImage,
                            //                 // height: 108,
                            //                 width: getSize(64),
                            //                 //fit: BoxFit.cover,
                            //               ),
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //       // Image.asset(
                            //       //   PngImageConstants.coupon_background,
                            //       //   width: Get.width,
                            //       //   fit: BoxFit.cover,
                            //       // ),
                            //       SizedBox(
                            //         height: getSize(8),
                            //       ),
                            //       Padding(
                            //         padding: EdgeInsets.symmetric(
                            //             horizontal: 12, vertical: 12),
                            //         child: Column(
                            //           crossAxisAlignment: CrossAxisAlignment.start,
                            //           children: [
                            //             Row(
                            //               mainAxisAlignment:
                            //                   MainAxisAlignment.spaceBetween,
                            //               children: [
                            //                 BaseText(
                            //                   text: controller
                            //                       .rewardsModelList[index]
                            //                       .offerText,
                            //                   fontSize: 14,
                            //                   fontWeight: FontWeight.w700,
                            //                 ),
                            //                 BaseText(
                            //                   text: "Free",
                            //                   fontSize: 10,
                            //                 ),
                            //               ],
                            //             ),
                            //             SizedBox(
                            //               height: getSize(6),
                            //             ),
                            //             BaseText(
                            //               text: controller
                            //                   .rewardsModelList[index].couponText,
                            //               fontSize: 12,
                            //               fontWeight: FontWeight.w500,
                            //               textColor:
                            //                   ColorConstants.white.withOpacity(0.8),
                            //             ),
                            //             SizedBox(
                            //               height: getSize(12),
                            //             ),
                            //             Row(
                            //               // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //               children: [
                            //                 BaseText(
                            //                   text: "Expires",
                            //                   fontSize: 10,
                            //                   textColor: ColorConstants.white
                            //                       .withOpacity(0.5),
                            //                 ),
                            //                 SizedBox(
                            //                   width: getSize(8),
                            //                 ),
                            //                 BaseText(
                            //                   text: controller
                            //                       .rewardsModelList[index]
                            //                       .expireDate,
                            //                   fontWeight: FontWeight.w500,
                            //                   fontSize: 12,
                            //                   textColor: ColorConstants.white
                            //                       .withOpacity(0.8),
                            //                 ),
                            //               ],
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      }),
    );
  }

  rewardsCard(RewardsResponse reward) {
    return Container(
      //color: Colors.red,
      child: CommonContainerWithShadow(
        borderRadius: SmoothBorderRadius.only(
          bottomLeft: SmoothRadius(
            cornerRadius: getSize(14),
            cornerSmoothing: 1,
          ),
          bottomRight: SmoothRadius(
            cornerRadius: getSize(14),
            cornerSmoothing: 1,
          ),
          topLeft: SmoothRadius(
            cornerRadius: getSize(16),
            cornerSmoothing: 1,
          ),
          topRight: SmoothRadius(
            cornerRadius: getSize(16),
            cornerSmoothing: 1,
          ),
        ),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
             // color: Colors.red,
              height: getSize(100),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // SvgPicture.asset(
                  //   controller.rewardsModelList[index]
                  //       .couponBackGroundImage,
                  //   width: getSize(150),
                  //   fit: BoxFit.fitWidth,
                  // ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Image(
                        image: NetworkImage(reward.image!),
                        height: getSize(64),
                        fit: BoxFit.fitWidth,
                      ),
                      // Image.asset(
                      //   controller.rewardsModelList[index].logoImage,
                      //   // height: 108,
                      //   width: getSize(64),
                      //   //fit: BoxFit.cover,
                      // ),
                    ),
                  ),
                ],
              ),
            ),
            // Image.asset(
            //   PngImageConstants.coupon_background,
            //   width: Get.width,
            //   fit: BoxFit.cover,
            // ),
            SizedBox(
              height: getSize(8),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BaseText(
                        text: "${reward.discount}% off",
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                      BaseText(
                        text: "Free",
                        fontSize: 10,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getSize(6),
                  ),
                  BaseText(
                    text: "${reward.name}",
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    textColor: ColorConstants.white.withOpacity(0.8),
                  ),
                  SizedBox(
                    height: getSize(12),
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BaseText(
                        text: "Expires",
                        fontSize: 10,
                        textColor: ColorConstants.white.withOpacity(0.5),
                      ),
                      SizedBox(
                        width: getSize(6),
                      ),
                      BaseText(
                        text: DateFormat('dd-MMM-yyyy').format(
                            new DateTime.fromMillisecondsSinceEpoch(
                                reward.expiresAt!)),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        textColor: ColorConstants.white.withOpacity(0.8),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  lockCard(RewardsResponse rew) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 12, right: 12),
          child: Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              SvgImageConstants.lock,
            ),
          ),
        ),
        SizedBox(
          height: getSize(36),
        ),
        BaseText(
          textAlign: TextAlign.center,
          text: "Required \nLevel ${rew.requiredLevel}",
          fontSize: 20,
          textColor: ColorConstants.white.withOpacity(0.94),
          fontWeight: FontWeight.w700,
        ),
        //Spacer(),
      ],
    );
  }

  showCouponDialog() {
    showDialog(
      barrierColor: Colors.black26,
      context: Get.context!,
      builder: (context) {
        return CouponDialog(
          continueCallBack: () {
            Get.back();
          },
        );
      },
    );
  }
}
