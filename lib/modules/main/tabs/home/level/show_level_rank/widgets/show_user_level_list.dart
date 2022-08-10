import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/level/show_level_rank/show_level_controller.dart';
import 'package:home_yogi_flutter/shared/constants/colors.dart';
import 'package:home_yogi_flutter/shared/constants/png_image_constant.dart';
import 'package:home_yogi_flutter/shared/utils/math_utils.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';
import 'package:home_yogi_flutter/shared/widgets/common_container_shadow.dart';

class ShowUserLevelListView extends GetView<ShowLevelController> {
  const ShowUserLevelListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
            horizontal: getSize(20),
          ),
          physics: BouncingScrollPhysics(),
          itemCount: controller.levelsTopResponse.value.allUsersRanking?.length,
          itemBuilder: (context, index) {
            return CommonSelectedContainerWithShadow(
              cornerRadius: 18,
              height: 66,
              padding: EdgeInsets.only(
                left: getSize(7),
                top: getSize(7),
                right: getSize(12),
                bottom: getSize(7),
              ),
              margin: EdgeInsets.symmetric(
                vertical: getSize(5),
              ),
              // showBorder: controller.showOtherUsersLevelRankModel[index].isCurrentUser,
              backgroundGradient: LinearGradient(
                colors: [
                  ColorConstants.gradiantBlue1,
                  ColorConstants.gradiantBlue2,
                ],
                begin: Alignment(-1.0, -4.0),
                end: Alignment(1.0, 4.0),
              ),
              borderGradient: LinearGradient(
                colors: [
                  Color.fromRGBO(255, 255, 255, 0.25),
                  Color.fromRGBO(255, 255, 255, 0.01)
                ],
                begin: Alignment(-1.0, -4.0),
                end: Alignment(1.0, 4.0),
              ),
              child: Row(
                children: [
                  Container(
                    height: getSize(55),
                    width: getSize(55),
                    decoration: BoxDecoration(
                      color: ColorConstants.blueShadow,
                      //border: Border.all(width: 2),
                      shape: BoxShape.circle,
                      boxShadow: (controller.levelsTopResponse.value
                          .currentUserRank) != null
                          ? [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.35),
                          offset: Offset(0, 0),
                          blurRadius: 4,
                        ),
                      ]
                          : null,
                    ),
                    child: Padding(
                      //this padding will be you border size
                      padding: EdgeInsets.all(getSize(3)),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle,),
                        child: CircleAvatar(
                          backgroundImage: controller.levelsTopResponse.value
                              .allUsersRanking?[index].profileImage != null
                              ? AssetImage(
                            controller.levelsTopResponse.value
                                .allUsersRanking?[index].profileImage ?? "",
                          )
                              : AssetImage(PngImageConstants.home),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getSize(20),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BaseText(
                        text: controller.levelsTopResponse.value
                            .allUsersRanking?[index].fullname ?? "",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: getSize(6),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            PngImageConstants.coin_without_shadow,
                            height: getSize(15),
                            width: getSize(15),
                          ),
                          SizedBox(
                            width: getSize(4),
                          ),
                          BaseText(
                            text: controller.levelsTopResponse.value
                                .allUsersRanking?[index].points.toString() ??
                                "",
                            fontSize: 10,
                          )
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  BaseText(
                    text: controller.levelsTopResponse.value
                        .allUsersRanking?[index].rank.toString() ?? "",
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),

              // child: ListTile(
              //   dense: true,
              //   minVerticalPadding: 0,
              //   contentPadding: EdgeInsets.only(
              //     left: getSize(7),
              //     right: getSize(12),
              //   ),
              //   leading: Container(
              //     height: getSize(52),
              //     width: getSize(52),
              //     decoration: BoxDecoration(
              //       color: ColorConstants.blueShadow,
              //       shape: BoxShape.circle,
              //     ),
              //     child: Padding(
              //       //this padding will be you border size
              //       padding: EdgeInsets.all(getSize(3)),
              //       child: Container(
              //         decoration: const BoxDecoration(
              //             color: Colors.white, shape: BoxShape.circle),
              //         child: CircleAvatar(
              //           backgroundImage: AssetImage(
              //             controller.showOtherUsersLevelRankMdel[index].image,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              //   title: BaseText(
              //     text:
              //         controller.showOtherUsersLevelRankMdel[index].isCurrentUser
              //             ? "You Currently Rank"
              //             : controller.showOtherUsersLevelRankMdel[index].name,
              //     fontSize: 14,
              //     fontWeight: FontWeight.w500,
              //   ),
              //   subtitle: Row(
              //     children: [
              //       Image.asset(
              //         PngImageConstants.coin_without_shadow,
              //         height: getSize(15),
              //         width: getSize(15),
              //       ),
              //       SizedBox(
              //         width: getSize(4),
              //       ),
              //       BaseText(
              //         text: controller.showOtherUsersLevelRankMdel[index].coin,
              //         fontSize: 10,
              //       )
              //     ],
              //   ),
              //   trailing: BaseText(
              //     text: controller.showOtherUsersLevelRankMdel[index].rank,
              //     fontSize: 22,
              //     fontWeight: FontWeight.w500,
              //   ),
              // ),
            );
          },
        );
      }),
    );
  }
}


// class ShowUserLevelListView extends GetView<ShowLevelController> {
//   const ShowUserLevelListView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         shrinkWrap: true,
//         padding: EdgeInsets.symmetric(
//           horizontal: getSize(20),
//         ),
//         physics: BouncingScrollPhysics(),
//         itemCount: controller.showOtherUsersLevelRankModel.length,
//         itemBuilder: (context, index) {
//           return CommonSelectedContainerWithShadow(
//             cornerRadius: 18,
//             height: controller.showOtherUsersLevelRankModel[index].isCurrentUser
//                 ? 66
//                 : null,
//             padding: EdgeInsets.only(
//               left: getSize(7),
//               top: getSize(7),
//               right: getSize(12),
//               bottom: getSize(7),
//             ),
//             margin: EdgeInsets.symmetric(
//               vertical: getSize(5),
//             ),
//             showBorder:
//             controller.showOtherUsersLevelRankModel[index].isCurrentUser,
//             backgroundGradient: LinearGradient(
//               colors: [
//                 ColorConstants.gradiantBlue1,
//                 ColorConstants.gradiantBlue2,
//               ],
//               begin: Alignment(-1.0, -4.0),
//               end: Alignment(1.0, 4.0),
//             ),
//             borderGradient: LinearGradient(
//               colors: [
//                 Color.fromRGBO(255, 255, 255, 0.25),
//                 Color.fromRGBO(255, 255, 255, 0.01)
//               ],
//               begin: Alignment(-1.0, -4.0),
//               end: Alignment(1.0, 4.0),
//             ),
//             child: Row(
//               children: [
//                 Container(
//                   height: getSize(55),
//                   width: getSize(55),
//                   decoration: BoxDecoration(
//                     color: ColorConstants.blueShadow,
//                     //border: Border.all(width: 2),
//                     shape: BoxShape.circle,
//                     boxShadow: !controller
//                         .showOtherUsersLevelRankModel[index].isCurrentUser
//                         ? [
//                       BoxShadow(
//                         color: Color.fromRGBO(0, 0, 0, 0.35),
//                         offset: Offset(0, 0),
//                         blurRadius: 4,
//                       ),
//                     ]
//                         : null,
//                   ),
//                   child: Padding(
//                     //this padding will be you border size
//                     padding: EdgeInsets.all(getSize(3)),
//                     child: Container(
//                       decoration:  BoxDecoration(
//                         color: Colors.white, shape: BoxShape.circle,),
//                       child: CircleAvatar(
//                         backgroundImage: AssetImage(
//                           controller.showOtherUsersLevelRankModel[index].image,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: getSize(20),
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     BaseText(
//                       text: controller.showOtherUsersLevelRankModel[index].isCurrentUser
//                           ? "You Currently Rank"
//                           : controller.showOtherUsersLevelRankModel[index].name,
//                       fontSize: controller.showOtherUsersLevelRankModel[index].isCurrentUser
//                           ? 16
//                           : 14,
//                       fontWeight: FontWeight.w500,
//                     ),
//                     SizedBox(
//                       height: getSize(6),
//                     ),
//                     Row(
//                       children: [
//                         Image.asset(
//                           PngImageConstants.coin_without_shadow,
//                           height: getSize(15),
//                           width: getSize(15),
//                         ),
//                         SizedBox(
//                           width: getSize(4),
//                         ),
//                         BaseText(
//                           text: controller
//                               .showOtherUsersLevelRankModel[index].coin,
//                           fontSize: 10,
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//                 Spacer(),
//                 BaseText(
//                   text: controller.showOtherUsersLevelRankModel[index].rank,
//                   fontSize: 22,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ],
//             ),
//
//             // child: ListTile(
//             //   dense: true,
//             //   minVerticalPadding: 0,
//             //   contentPadding: EdgeInsets.only(
//             //     left: getSize(7),
//             //     right: getSize(12),
//             //   ),
//             //   leading: Container(
//             //     height: getSize(52),
//             //     width: getSize(52),
//             //     decoration: BoxDecoration(
//             //       color: ColorConstants.blueShadow,
//             //       shape: BoxShape.circle,
//             //     ),
//             //     child: Padding(
//             //       //this padding will be you border size
//             //       padding: EdgeInsets.all(getSize(3)),
//             //       child: Container(
//             //         decoration: const BoxDecoration(
//             //             color: Colors.white, shape: BoxShape.circle),
//             //         child: CircleAvatar(
//             //           backgroundImage: AssetImage(
//             //             controller.showOtherUsersLevelRankMdel[index].image,
//             //           ),
//             //         ),
//             //       ),
//             //     ),
//             //   ),
//             //   title: BaseText(
//             //     text:
//             //         controller.showOtherUsersLevelRankMdel[index].isCurrentUser
//             //             ? "You Currently Rank"
//             //             : controller.showOtherUsersLevelRankMdel[index].name,
//             //     fontSize: 14,
//             //     fontWeight: FontWeight.w500,
//             //   ),
//             //   subtitle: Row(
//             //     children: [
//             //       Image.asset(
//             //         PngImageConstants.coin_without_shadow,
//             //         height: getSize(15),
//             //         width: getSize(15),
//             //       ),
//             //       SizedBox(
//             //         width: getSize(4),
//             //       ),
//             //       BaseText(
//             //         text: controller.showOtherUsersLevelRankMdel[index].coin,
//             //         fontSize: 10,
//             //       )
//             //     ],
//             //   ),
//             //   trailing: BaseText(
//             //     text: controller.showOtherUsersLevelRankMdel[index].rank,
//             //     fontSize: 22,
//             //     fontWeight: FontWeight.w500,
//             //   ),
//             // ),
//           );
//         },
//       ),
//     );
//   }
// }