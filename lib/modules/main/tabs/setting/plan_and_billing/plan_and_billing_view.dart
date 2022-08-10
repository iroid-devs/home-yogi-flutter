import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/setting/plan_and_billing/plan_and_billing_controller.dart';
import 'package:home_yogi_flutter/shared/constants/colors.dart';
import 'package:home_yogi_flutter/shared/widgets/common_app_bar.dart';

import '../../../../../shared/constants/svg_image_constant.dart';
import '../../../../../shared/utils/math_utils.dart';
import '../../../../../shared/widgets/base_text.dart';
import '../../../../../shared/widgets/common_container_shadow.dart';

class PlanAndBillingScreen extends GetView<PlanAndBillingController> {
  final String appBarText;

  final bool fromUpgradePlan;

  const PlanAndBillingScreen(
      {Key? key, this.fromUpgradePlan = false, required this.appBarText})
      : super(key: key);

  // bool selectedIndex = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: appBarText,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            fromUpgradePlan
                ? Container()
                : CommonContainerWithShadow(
              backgroundColor: ColorConstants.greenColor,
              child: Column(
                children: [
                  SizedBox(
                    height: getSize(8),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        SvgImageConstants.tick_white,
                      ),
                      SizedBox(
                        width: getSize(10),
                      ),
                      BaseText(
                        text: "Your current plan",
                        fontSize: 14,
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorConstants.darkContainerBlack,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: ColorConstants.darkContainerBlack,
                          width: 1),
                    ),
                    margin: EdgeInsets.only(top: 8),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: ListTile(
                            title: BaseText(
                              text: "Free plan",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              textColor: Colors.white.withOpacity(0.94),
                            ),
                            trailing: BaseText(
                              text: "Lifetime",
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Divider(
                            height: 1,
                            color: ColorConstants.white.withOpacity(0.1),
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: getSize(10),
                            ),
                            textView(text: 'Self assess your home'),
                            textView(text: 'Seasonal examination'),
                            textView(text: 'Checklist'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            fromUpgradePlan
                ? Container()
                : Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: BaseText(
                textAlign: TextAlign.center,
                text: "Upgrade your plan",
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonContainerWithShadow(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 12),
                        child: Center(
                          child: BaseText(
                            text: "Features",
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.only(left: 10.0, right: 10, bottom: 12),
                        child: Divider(
                          color: ColorConstants.white.withOpacity(0.1),
                        ),
                      ),
                      // for(int i = 0; i <
                      //     controller.subscriptionPlanResponse.length; i++)
                      //   for(int j = 0; j <
                      //       controller.subscriptionPlanResponse[i].features!
                      //           .split(",").length; j++)
                      //     Obx(() {
                      //       return textView(
                      //           text: controller.subscriptionPlanResponse[i]
                      //               .features!.split(",")[j]);
                      //     })
                      // Obx(() {
                      //   return ListView.builder(
                      //     shrinkWrap: true,
                      //     physics: NeverScrollableScrollPhysics(),
                      //     itemCount: controller.subscriptionPlanResponse.length,
                      //     itemBuilder: (context, index) {
                      //       print("ddf=================${controller.subscriptionPlanResponse[index].features!.split(",").length}");
                      //       for (int i = 0; i < controller.subscriptionPlanResponse[index].features!.split(",").length; i++) {
                      //         printInfo(info: "====${controller.subscriptionPlanResponse[index].features!.split(",")[i]}");
                      //         return Text("data");
                      //       }
                      //       return SizedBox();
                      //
                      //       /*return textView(
                      //           text: controller.subscriptionPlanResponse[index].features!.split(",")[index]);*/
                      //     },
                      //   );
                      // })
                      // textView(text: controller.subscriptionPlanResponse[0].features!.split(",")[0]),
                      // textView(text: controller.subscriptionPlanResponse[1].features!.split(",")[1]),
                      // textView(text: controller.subscriptionPlanResponse[0].features!.split(",")[2]),
                      // textView(text: controller.subscriptionPlanResponse[1].features!.split(",")[3]),
                      // textView(text: controller.subscriptionPlanResponse[0].features!.split(",")[4]),
                      textView(text: 'Account manager'),
                      textView(text: 'Quarterly Examination and inspection by professional inspector'),
                      textView(text: 'Provide home data & history'),
                      textView(text: 'Summary report'),
                      textView(text: 'Free unlock discount coupons and points'),
                    ],
                  ),
                ),
                SizedBox(
                  height: getSize(30),
                ),
                BaseText(
                  text: "Select plan",
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
                SizedBox(
                  height: getSize(20),
                ),
                Obx(() {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.subscriptionPlanResponse.length,
                    itemBuilder: (context, index) {
                      return Obx(() {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 20.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              controller.planSelect(
                                  controller.planAndBillingModel[index]);
                            },
                            child: CommonSelectedContainerWithShadow(
                              showBorder: true,
                              backgroundGradient: controller
                                  .planAndBillingModel[index]
                                  .isSelected
                                  .value
                                  ? LinearGradient(
                                colors: [
                                  Color.fromRGBO(99, 185, 255, 1),
                                  Color.fromRGBO(16, 89, 146, 1),
                                ],
                                begin: Alignment(-1.0, -4.0),
                                end: Alignment(1.0, 4.0),
                              )
                                  : null,
                              child: Column(
                                children: [
                                  ListTile(
                                    contentPadding: EdgeInsets.only(
                                        left: 20, right: 20, bottom: 4, top: 0),
                                    visualDensity: VisualDensity(
                                        horizontal: 0, vertical: -4),
                                    title: BaseText(
                                      text: controller
                                          .subscriptionPlanResponse[index]
                                          .title ??
                                          "",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    ),
                                    subtitle: BaseText(
                                      text: controller
                                          .subscriptionPlanResponse[index]
                                          .description ??
                                          "",
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      textColor:
                                      ColorConstants.white.withOpacity(0.8),
                                    ),
                                    trailing: Padding(
                                      padding: EdgeInsets.only(top: 8),
                                      child: RichText(
                                        text: TextSpan(
                                          text: controller
                                              .subscriptionPlanResponse[index]
                                              .price
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Readex Pro',
                                          ),
                                          children: [
                                            TextSpan(
                                              text: controller
                                                  .subscriptionPlanResponse[
                                              index]
                                                  .originalPrice
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  color: Colors.white
                                                      .withOpacity(0.5)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: getSize(6),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                    },
                  );
                }),
              ],
            ),
            // UpgradePlanScreen(),
          ],
        ),
      ),
    );
  }

  textView({required String text}) {
    return Padding(
      padding: EdgeInsets.only(right: 26, left: 15, bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            SvgImageConstants.tick,
          ),
          SizedBox(
            width: getSize(10),
          ),
          Expanded(
            child: BaseText(
              text: text,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

// class PlanAndBillingScreen extends GetView<PlanAndBillingController> {
//   final String appBarText;
//
//   final bool fromUpgradePlan;
//
//   const PlanAndBillingScreen(
//       {Key? key, this.fromUpgradePlan = false, required this.appBarText})
//       : super(key: key);
//
//   // bool selectedIndex = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: BaseAppBar(
//         title: appBarText,
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 30.0),
//         child: ListView(
//           physics: BouncingScrollPhysics(),
//           shrinkWrap: true,
//           children: [
//             fromUpgradePlan
//                 ? Container()
//                 : CommonContainerWithShadow(
//               backgroundColor: ColorConstants.greenColor,
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: getSize(8),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SvgPicture.asset(
//                         SvgImageConstants.tick_white,
//                       ),
//                       SizedBox(
//                         width: getSize(10),
//                       ),
//                       BaseText(
//                         text: "Your current plan",
//                         fontSize: 14,
//                       ),
//                     ],
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: ColorConstants.darkContainerBlack,
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(
//                           color: ColorConstants.darkContainerBlack,
//                           width: 1),
//                     ),
//                     margin: EdgeInsets.only(top: 8),
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 16),
//                           child: ListTile(
//                             title: BaseText(
//                               text: "Free plan",
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                               textColor: Colors.white.withOpacity(0.94),
//                             ),
//                             trailing: BaseText(
//                               text: "Lifetime",
//                               fontWeight: FontWeight.w500,
//                               fontSize: 10,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 10),
//                           child: Divider(
//                             height: 1,
//                             color: ColorConstants.white.withOpacity(0.1),
//                           ),
//                         ),
//                         Column(
//                           children: [
//                             SizedBox(
//                               height: getSize(10),
//                             ),
//                             textView(text: 'Self assess your home'),
//                             textView(text: 'Seasonal examination'),
//                             textView(text: 'Checklist'),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             fromUpgradePlan
//                 ? Container()
//                 : Padding(
//               padding: EdgeInsets.symmetric(vertical: 30),
//               child: BaseText(
//                 textAlign: TextAlign.center,
//                 text: "Upgrade your plan",
//                 fontSize: 22,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CommonContainerWithShadow(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(top: 20, bottom: 12),
//                         child: Center(
//                           child: BaseText(
//                             text: "Features",
//                             fontWeight: FontWeight.w500,
//                             fontSize: 18,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding:
//                         EdgeInsets.only(left: 10.0, right: 10, bottom: 12),
//                         child: Divider(
//                           color: ColorConstants.white.withOpacity(0.1),
//                         ),
//                       ),
//                       textView(text: 'Account manager'),
//                       textView(
//                           text:
//                           'Quarterly Examination and inspection by professional inspector'),
//                       textView(text: 'Provide home data & history'),
//                       textView(text: 'Summary report'),
//                       textView(text: 'Free unlock discount coupons and points'),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: getSize(30),
//                 ),
//                 BaseText(
//                   text: "Select plan",
//                   fontWeight: FontWeight.w500,
//                   fontSize: 18,
//                 ),
//                 SizedBox(
//                   height: getSize(20),
//                 ),
//                 ListView.builder(
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   itemCount: controller.planAndBillingModel.length,
//                   itemBuilder: (context, index) {
//                     return Obx(() {
//                       return Padding(
//                         padding: EdgeInsets.only(bottom: 20.0),
//                         child: InkWell(
//                           splashColor: Colors.transparent,
//                           onTap: () {
//                             controller.planSelect(
//                                 controller.planAndBillingModel[index]);
//                           },
//                           child: CommonSelectedContainerWithShadow(
//                             showBorder: true,
//                             backgroundGradient: controller
//                                 .planAndBillingModel[index].isSelected.value
//                                 ? LinearGradient(
//                               colors: [
//                                 Color.fromRGBO(99, 185, 255, 1),
//                                 Color.fromRGBO(16, 89, 146, 1),
//                               ],
//                               begin: Alignment(-1.0, -4.0),
//                               end: Alignment(1.0, 4.0),
//                             )
//                                 : null,
//                             child: Column(
//                               children: [
//                                 ListTile(
//                                   contentPadding: EdgeInsets.only(
//                                       left: 20, right: 20, bottom: 4, top: 0),
//                                   visualDensity: VisualDensity(
//                                       horizontal: 0, vertical: -4),
//                                   title: BaseText(
//                                     text: controller.planAndBillingModel[index].titleText.toString(),
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 18,
//                                   ),
//                                   subtitle: BaseText(
//                                     text: controller.planAndBillingModel[index].subtitle.toString(),
//                                     fontSize: 10,
//                                     fontWeight: FontWeight.w500,
//                                     textColor:
//                                     ColorConstants.white.withOpacity(0.8),
//                                   ),
//                                   trailing: Padding(
//                                     padding: EdgeInsets.only(top: 8),
//                                     child: RichText(
//                                       text: TextSpan(
//                                         text: controller.planAndBillingModel[index].offerAmountText,
//                                         style: TextStyle(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w500,
//                                           fontFamily: 'Readex Pro',
//                                         ),
//                                         children: [
//                                           TextSpan(
//                                             text: controller.planAndBillingModel[index].totalAmount,
//                                             style: TextStyle(
//                                                 fontSize: 12,
//                                                 decoration:
//                                                 TextDecoration.lineThrough,
//                                                 color: Colors.white
//                                                     .withOpacity(0.5)),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: getSize(6),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     });
//                   },
//                 ),
//               ],
//             ),
//             // UpgradePlanScreen(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   textView({required String text}) {
//     return Padding(
//       padding: EdgeInsets.only(right: 26, left: 15, bottom: 12),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           SvgPicture.asset(
//             SvgImageConstants.tick,
//           ),
//           SizedBox(
//             width: getSize(10),
//           ),
//           Expanded(
//             child: BaseText(
//               text: text,
//               fontSize: 14,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
