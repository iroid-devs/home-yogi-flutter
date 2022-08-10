import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/home_controller.dart';
import '../../../../../../models/response/home/to_do_list_response.dart';
import '../../../../../../routes/app_pages.dart';
import '../../../../../../shared/constants/gradiant_color.dart';
import '../../../../../../shared/constants/svg_image_constant.dart';
import '../../../../../../shared/utils/math_utils.dart';
import '../../../../../../shared/widgets/base_text.dart';
import '../../../../../../shared/widgets/common_container_shadow.dart';
import '../../../../../../shared/widgets/gradiant_container_with_image.dart';
import '../models/to_do_list_model.dart';

class TaskTagList extends GetView<HomeController> {
  const TaskTagList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.gradiantColorIndex = -1;
    printInfo(info: 'buildMethode() called.... ${controller.gradiantColorIndex}');
    return Obx(() {
      return  controller.toDoListResponse.value.taskByTags?.length != null ?
      ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.toDoListResponse.value.taskByTags?.length,
        itemBuilder: (BuildContext context, int index) {
          controller.incrementGradiantColorIndex();
          return _buildListTile(index);
        },
      ) :
      Container();
    });
  }

  _buildListTile(int index) {
    final theme = Get.theme.copyWith(
      dividerColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
    );
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: CommonContainerWithShadow(
        child: ListTileTheme(
          contentPadding: EdgeInsets.symmetric(
            horizontal: getSize(10),
          ),
          //visualDensity: VisualDensity(vertical: -2),
          horizontalTitleGap: getSize(20),
          child: Theme(
            data: theme,
            child: ListTile(
              onTap: () {
                TaskByTags taskByTags = controller.toDoListResponse.value.taskByTags![index];
                Map<String,dynamic> argumentMap = {
                  'viewType':2,
                  'model': taskByTags,
                };
                // ToDoListModel toDoListModel = ToDoListModel(
                //   controller.tagList[index],
                //   getAssetsSVGImg('task_tag'),
                //   50,
                //   10,
                //   GradientColor().colorsList[controller.gradiantColorIndex],
                // );
                Get.toNamed(Routes.TASK_CATEGORY, arguments: argumentMap);
                GradientColor().colorsList[controller.gradiantColorIndex];
                // Get.toNamed(Routes.TASK_CATEGORY, arguments: toDoListModel);
                // Get.toNamed(Routes.TASK_CATEGORY);
              },
              leading: GradiantContainerWithImage(
                width: getSize(44),
                height: getSize(44),
                borderRadius: 10,
                image: Image.network(
                  controller.toDoListResponse.value.taskByTags![index].iconImage.toString(),
                  height: getSize(22),
                ),
                // SvgPicture.asset(
                //   getAssetsSVGImg('task_tag'),
                //   height: getSize(22),
                // ),
                gradientBorderColor:
                GradientColor().colorsList[controller.gradiantColorIndex],
                gradientContainerColor:
                GradientColor().colorsList[controller.gradiantColorIndex],
              ),
              title: BaseText(
                text: controller.toDoListResponse.value.taskByTags![index].name
                    .toString(),
                fontWeight: FontWeight.w500,
              ),
              trailing: Padding(
                padding: EdgeInsets.only(
                  right: getSize(10),
                ),
                child: SvgPicture.asset(
                  SvgImageConstants.arrowRight,
                  //height: getSize(10),
                  //width: getSize(10),
                  // height: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class TaskTagList extends GetView<HomeController> {
//   const TaskTagList({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       physics: NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       itemCount: controller.tagList.length,
//       itemBuilder: (BuildContext context, int index) {
//         controller.incrementGradiantColorIndex();
//         return _buildListTile(index);
//       },
//     );
//   }
//
//   _buildListTile(int index) {
//     final theme = Get.theme.copyWith(
//       dividerColor: Colors.transparent,
//       splashColor: Colors.transparent,
//       highlightColor: Colors.transparent,
//       hoverColor: Colors.transparent,
//     );
//
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 20.0),
//       child: CommonContainerWithShadow(
//         child: ListTileTheme(
//           contentPadding: EdgeInsets.symmetric(
//             horizontal: getSize(10),
//           ),
//           //visualDensity: VisualDensity(vertical: -2),
//           horizontalTitleGap: getSize(20),
//
//           child: Theme(
//             data: theme,
//             child: ListTile(
//               onTap: () {
//                 ToDoListModel toDoListModel = ToDoListModel(
//                   controller.tagList[index],
//                   getAssetsSVGImg('task_tag'),
//                   50,
//                   10,
//                   GradientColor().colorsList[controller.gradiantColorIndex],
//                 );
//
//                 Get.toNamed(Routes.TASK_CATEGORY, arguments: toDoListModel);
//                 Get.toNamed(Routes.TASK_CATEGORY);
//               },
//               leading: GradiantContainerWithImage(
//                 width: getSize(44),
//                 height: getSize(44),
//                 borderRadius: 10,
//                 image: SvgPicture.asset(
//                   getAssetsSVGImg('task_tag'),
//                   height: getSize(22),
//                 ),
//                 gradientBorderColor:
//                 GradientColor().colorsList[controller.gradiantColorIndex],
//                 gradientContainerColor:
//                 GradientColor().colorsList[controller.gradiantColorIndex],
//               ),
//               title: BaseText(
//                 text: controller.tagList[index],
//                 fontWeight: FontWeight.w500,
//               ),
//               trailing: Padding(
//                 padding: EdgeInsets.only(
//                   right: getSize(10),
//                 ),
//                 child: SvgPicture.asset(
//                   SvgImageConstants.arrowRight,
//                   //height: getSize(10),
//                   //width: getSize(10),
//                   // height: 18,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
