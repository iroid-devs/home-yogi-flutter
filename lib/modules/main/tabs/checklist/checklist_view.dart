import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/models/response/home/check_list_response.dart';
import 'package:home_yogi_flutter/shared/utils/math_utils.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';
import 'package:home_yogi_flutter/shared/widgets/circle_progress_indicator.dart';
import '../../../../../shared/widgets/common_app_bar.dart';
import '../../../../di.dart';
import '../../../../routes/app_pages.dart';
import '../../../../shared/constants/colors.dart';
import '../../../../shared/constants/png_image_constant.dart';
import '../../../../shared/widgets/common_container_shadow.dart';
import '../../../../shared/widgets/common_linear_progress.dart';
import '../../../../shared/widgets/common_listtile_with_image.dart';
import '../../../../shared/widgets/show_coin.dart';
import 'checklist_controller.dart';

// class CheckListView extends GetView<CheckListController> {
//   const CheckListView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     printInfo(info: controller.checkListResponse.value.checklists?[0].title.toString() ??"");
//     return Scaffold(
//       appBar: BaseAppBar(
//         title: 'Checklist',
//         leading: Container(
//           margin: EdgeInsets.only(
//             left: getSize(20),
//           ),
//           child: BaseCircleProgressIndicator(
//             radius: 20,
//             lineWidth: 3.5,
//             percent: 0.75,
//           ),
//         ),
//         actions: [
//           ShowCoin(
//             numberText: 575,
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: _buildMainBody(),
//         physics: BouncingScrollPhysics(),
//       ),
//     );
//   }
//
//   _buildMainBody() {
//     return Container(
//       margin: EdgeInsets.all(
//         getSize(24.0),
//       ),
//       child: Column(
//         children: [
//           _buildCard(),
//           SizedBox(
//             height: getSize(30.0),
//           ),
//           BaseText(
//             text: "Summer Checklist",
//             fontWeight: FontWeight.w500,
//             fontSize: 18,
//           ),
//           SizedBox(
//             height: getSize(20.0),
//           ),
//           _buildListView(),
//         ],
//       ),
//     );
//   }
//
//   _buildCard() {
//     return CommonContainerWithShadow(
//       cornerRadius: 20,
//       width: double.maxFinite,
//       child: Padding(
//         padding: EdgeInsets.all(getSize(20.0)),
//         child: Column(
//           children: [
//             Image.asset(
//               PngImageConstants.smile,
//             ),
//             SizedBox(
//               height: getSize(8),
//             ),
//             BaseText(
//               text:
//               "Yor are few steps ahead to unlock \nthe rewards of level 6 ",
//               fontWeight: FontWeight.w500,
//               fontSize: 14,
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   _buildListView() {
//     return ListView.builder(
//       physics: NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       itemCount: controller.checkListResponse.value.checklists?.length,
//       itemBuilder: (BuildContext context, int index) {
//         return Padding(
//           padding: EdgeInsets.only(
//             bottom: getSize(20.0),
//           ),
//           child: CommonListTileWithImage(
//             image: Image.network(
//               controller.checkListResponse.value.checklists?[index].iconImage.toString() ??""
//             ),
//
//             // Image.asset(
//             //   getAssetsPNGImg(
//             //     controller.checkListModelList[index].image,
//             //   ),
//             //   height: getSize(50),
//             // ),
//             titleText:    controller.checkListResponse.value.checklists?[index].title.toString() ??"" ,
//             percentage: 10,
//             gradientContainerColor: [
//               ColorConstants.gradientPinkStart,
//               ColorConstants.gradientPinkEnd,
//             ],
//             // gradientBorderColor: controller.checkListModelList[index].gradientBorderColor,
//             gradientBorderColor: [
//               ColorConstants.gradientPinkStart,
//               ColorConstants.gradientPinkEnd,
//             ],
//             onClickCallback: () {
//               // Get.toNamed(
//               //   Routes.CHECKLIST_CATEGORY,
//               //   //arguments: controller.checkListModelList[index],
//               //   arguments: controller.checkListModelList[index].titleText,
//               // );
//             },
//             progressBar: getLinearProgress(),
//             rowWidget: _buildRow(),
//           ),
//         );
//       },
//     );
//   }
//
//   _buildRow() {
//     return Row(
//       //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Image.asset(
//           getAssetsPNGImg('chart_square'),
//           height: getSize(15),
//         ),
//         SizedBox(
//           width: getSize(8.0),
//         ),
//         BaseText(
//           text: 'Progress',
//           fontSize: 10,
//         ),
//         Spacer(),
//         SizedBox(
//           width: getSize(98),
//         ),
//         BaseText(
//           text: '10%',
//           fontSize: 10,
//         ),
//         Spacer(),
//         // SizedBox(
//         //   width: getSize(18),
//         // ),
//       ],
//     );
//   }
//
//   Widget getLinearProgress() {
//     return CommonLinearProgressWidget(
//       width: getSize(100),
//       remaining: 5,
//       total: 10,
//     );
//   }
// }

class CheckListView extends GetView<CheckListController> {
  const CheckListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Checklist',
        leading: Container(
          margin: EdgeInsets.only(
            left: getSize(24),
          ),
          child: BaseCircleProgressIndicator(
            radius: 20,
            lineWidth: 3.5,
            percent: 0.75,
            imagePath: DenpendencyInjection.userResponse.profileImage != null
                ? DenpendencyInjection.userResponse.profileImage
                : controller.editProfileController.pickedImagePath.value,
            //  imageUrl: DenpendencyInjection.userResponse.profileImage,
          ),
        ),
        actions: [
          ShowCoin(
            numberText: 575,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: _buildMainBody(),
        physics: BouncingScrollPhysics(),
      ),
    );
  }

  _buildMainBody() {
    return Container(
      margin: EdgeInsets.all(
        getSize(24.0),
      ),
      child: Column(
        children: [
          _buildCard(),
          SizedBox(
            height: getSize(30.0),
          ),
          Obx(() {
            return BaseText(
              text:
                  "${controller.checkListResponse.value.currentSeason.toString()} Checklist",
              fontWeight: FontWeight.w500,
              fontSize: 18,
            );
          }),
          SizedBox(
            height: getSize(20.0),
          ),
          Obx(
            () => controller.checkListResponse.value.checklists != null
                ? _buildListView()
                : Container(),
          ),
        ],
      ),
    );
  }

  _buildCard() {
    return CommonContainerWithShadow(
      cornerRadius: 20,
      width: double.maxFinite,
      child: Padding(
        padding: EdgeInsets.all(getSize(20.0)),
        child: Column(
          children: [
            Image.asset(
              PngImageConstants.smile,
            ),
            SizedBox(
              height: getSize(8),
            ),
            BaseText(
              text:
                  "Yor are few steps ahead to unlock \nthe rewards of level 6 ",
              fontWeight: FontWeight.w500,
              fontSize: 14,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  _buildListView() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.checkListResponse.value.checklists?.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: getSize(20.0),
          ),
          child: CommonListTileWithImage(
            image: Image.network(
              //"http://134.209.145.75:3008/assets/checklist.png",
              controller.checkListResponse.value.checklists![index].iconImage ??
                  "",
              height: getSize(50),
            ),
            // Image.asset(
            //   getAssetsPNGImg(
            //     controller.checkListModelList[index].image,
            //   ),
            //   height: getSize(50),
            // ),
            titleText:
                controller.checkListResponse.value.checklists![index].title ??
                    "",
            // titleText: controller.checkListModelList[index].titleText,
            //  percentage: controller.checkListModelList[index].percentage,
            percentage: 0,
            // gradientContainerColor: controller.checkListModelList[index].gradientContainerColor,
            gradientContainerColor: controller.checkListResponse.value
                .checklists![index].gradientContainerColor,
            gradientBorderColor: controller
                .checkListResponse.value.checklists![index].gradientBorderColor,
            onClickCallback: () {
              Get.toNamed(
                Routes.CHECKLIST_CATEGORY,
                // arguments: controller.checkListResponse.value.checklists?[index],
                //arguments: controller.checkListModelList[index],
                arguments:
                    controller.checkListResponse.value.checklists![index].title,
              );
            },
            progressBar: getLinearProgress(),
            rowWidget: _buildRow(index),
          ),
        );
      },
    );
  }

  _buildRow(int index) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          getAssetsPNGImg('chart_square'),
          height: getSize(15),
        ),
        SizedBox(
          width: getSize(8.0),
        ),
        BaseText(
          text: 'Progress',
          fontSize: 10,
        ),
        Spacer(),
        SizedBox(
          width: getSize(100),
        ),
        BaseText(
          //text: "10",
          text:
              "${(controller.checkListResponse.value.checklists?[index].totalCompletedChecklists) ?? 0 / (controller.checkListResponse.value.checklists?[index].totalChecklists)!}%",
          fontSize: 10,
        ),
        Spacer(),
      ],
    );
  }

  Widget getLinearProgress() {
    return CommonLinearProgressWidget(
      width: getSize(100),
      remaining: 5,
      total: 10,
    );
  }
}

// class CheckListView extends GetView<CheckListController> {
//   const CheckListView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: BaseAppBar(
//         title: 'Checklist',
//         leading: Container(
//           margin: EdgeInsets.only(
//             left: getSize(20),
//           ),
//           child: BaseCircleProgressIndicator(
//             radius: 20,
//             lineWidth: 3.5,
//             percent: 0.75,
//           ),
//         ),
//         actions: [
//           ShowCoin(
//             numberText: 575,
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: _buildMainBody(),
//         physics: BouncingScrollPhysics(),
//       ),
//     );
//   }
//
//   _buildMainBody() {
//     return Container(
//       margin: EdgeInsets.all(
//         getSize(24.0),
//       ),
//       child: Column(
//         children: [
//           _buildCard(),
//           SizedBox(
//             height: getSize(30.0),
//           ),
//           BaseText(
//             text: "Summer Checklist",
//             fontWeight: FontWeight.w500,
//             fontSize: 18,
//           ),
//           SizedBox(
//             height: getSize(20.0),
//           ),
//           _buildListView(),
//         ],
//       ),
//     );
//   }
//
//   _buildCard() {
//     return CommonContainerWithShadow(
//       cornerRadius: 20,
//       width: double.maxFinite,
//       child: Padding(
//         padding: EdgeInsets.all(getSize(20.0)),
//         child: Column(
//           children: [
//             Image.asset(
//               PngImageConstants.smile,
//             ),
//             SizedBox(
//               height: getSize(8),
//             ),
//             BaseText(
//               text:
//               "Yor are few steps ahead to unlock \nthe rewards of level 6 ",
//               fontWeight: FontWeight.w500,
//               fontSize: 14,
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   _buildListView() {
//     return ListView.builder(
//       physics: NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       itemCount: controller.checkListModelList.length,
//       itemBuilder: (BuildContext context, int index) {
//         return Padding(
//           padding: EdgeInsets.only(
//             bottom: getSize(20.0),
//           ),
//           child: CommonListTileWithImage(
//             image: Image.asset(
//               getAssetsPNGImg(
//                 controller.checkListModelList[index].image,
//               ),
//               height: getSize(50),
//             ),
//             titleText: controller.checkListModelList[index].titleText,
//             percentage: controller.checkListModelList[index].percentage,
//             gradientContainerColor:
//             controller.checkListModelList[index].gradientContainerColor,
//             gradientBorderColor:
//             controller.checkListModelList[index].gradientBorderColor,
//             onClickCallback: () {
//               Get.toNamed(
//                 Routes.CHECKLIST_CATEGORY,
//                 //arguments: controller.checkListModelList[index],
//                 arguments: controller.checkListModelList[index].titleText,
//               );
//             },
//             progressBar: getLinearProgress(),
//             rowWidget: _buildRow(),
//           ),
//         );
//       },
//     );
//   }
//
//   _buildRow() {
//     return Row(
//       //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Image.asset(
//           getAssetsPNGImg('chart_square'),
//           height: getSize(15),
//         ),
//         SizedBox(
//           width: getSize(8.0),
//         ),
//         BaseText(
//           text: 'Progress',
//           fontSize: 10,
//         ),
//         Spacer(),
//         SizedBox(
//           width: getSize(98),
//         ),
//         BaseText(
//           text: '10%',
//           fontSize: 10,
//         ),
//         Spacer(),
//         // SizedBox(
//         //   width: getSize(18),
//         // ),
//       ],
//     );
//   }
//
//   Widget getLinearProgress() {
//     return CommonLinearProgressWidget(
//       width: getSize(100),
//       remaining: 5,
//       total: 10,
//     );
//   }
// }
