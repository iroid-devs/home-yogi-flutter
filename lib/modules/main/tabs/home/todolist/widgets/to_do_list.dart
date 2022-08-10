import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/home_controller.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/todolist/models/to_do_list_model.dart';
import 'package:home_yogi_flutter/shared/constants/constants.dart';
import 'package:home_yogi_flutter/shared/utils/math_utils.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';
import 'package:home_yogi_flutter/shared/widgets/common_linear_progress.dart';
import 'package:home_yogi_flutter/shared/widgets/common_listtile_with_image.dart';
import 'package:home_yogi_flutter/shared/widgets/gradiant_container_with_image.dart';
import 'package:get/get.dart';

import '../../../../../../models/response/home/to_do_list_response.dart';
import '../../../../../../routes/app_pages.dart';

class ToDoList extends GetView<HomeController> {
  const ToDoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: controller.toDoListResponse.value.onGoingTask?.length,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: getSize(12),
            ),
            child: CommonListTileWithImage(
              height: getSize(73),
              width: getSize(73),
              onClickCallback: () {
                OnGoingTask onGoingTask = controller.toDoListResponse.value.onGoingTask![index];
                Map<String,dynamic> argumentMap = {
                  'viewType':1,
                  'model':onGoingTask,
                };
                //ToDoListModel toDoListModel = controller.toDoList[index];
                Get.toNamed(Routes.TASK_CATEGORY, arguments: argumentMap);
                //Get.toNamed(Routes.TASK_CATEGORY, arguments: toDoListModel);
              },
              titleText: controller.toDoListResponse.value.onGoingTask![index].title.toString(),
              image: Image.network(
                controller.toDoListResponse.value.onGoingTask![index].iconImage.toString(),
                height: getSize(40),
              ),
              // SvgPicture.asset(
              //   controller.toDoList[index].image,
              //   height: getSize(40),
              // ),
              gradientBorderColor:
                  controller.toDoList[index].gradientContainerColor ?? [],
              gradientContainerColor:
                  controller.toDoList[index].gradientContainerColor!,
              percentage: 56,
              progressBar: getLinearProgress(index),
              rowWidget: _buildRow(index),
            ),
          );
        },
      ),
    );
  }

  _buildRow(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          getAssetsSVGImg('task_left'),
          height: getSize(15),
        ),
        SizedBox(
          width: getSize(7.0),
        ),
        BaseText(
          text: StringConstants.leftToDo,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
        Spacer(),
        SizedBox(
          width: getSize(90),
        ),
        BaseText(
          text: "${controller.toDoListResponse.value.onGoingTask![index].totalCompletedTasks}/${controller.toDoListResponse.value.onGoingTask![index].totalTasks}",
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
        Spacer(),
        // SvgPicture.asset(
        //   getAssetsSVGImg('task_left'),
        //   height: 15,
        // ),
        // SizedBox(
        //   width: getSize(10.0),
        // ),
        // BaseText(
        //   text: 'Left to do',
        //   fontSize: 10,
        // ),
        // Spacer(),
        // BaseText(
        //   text:
        //       "${controller.toDoList[index].remaining}/${controller.toDoList[index].total}",
        //   fontSize: 10,
        // ),
        // SizedBox(
        //   width: getSize(10.0),
        // ),
      ],
    );
  }

  Widget getLinearProgress(int index) {
    return CommonLinearProgressWidget(
      width:  getSize(280),
      remaining: controller.toDoListResponse.value.onGoingTask![index].totalCompletedTasks!.toDouble(),
      total: controller.toDoListResponse.value.onGoingTask![index].totalTasks!.toDouble(),
    );
  }

  Padding getText(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getSize(14.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BaseText(
            text: StringConstants.leftToDo,
            fontSize: 10,
            fontWeight: FontWeight.w600,
            textColor: Colors.white.withOpacity(0.8),
          ),
          BaseText(
            text:
                "${controller.toDoList[index].remaining}/${controller.toDoList[index].total}",
            fontSize: 10,
            fontWeight: FontWeight.w600,
            textColor: Colors.white.withOpacity(0.8),
          ),
        ],
      ),
    );
  }

  Row getImageTileView(int index) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: getSize(8.0), top: getSize(8.0)),
          child: GradiantContainerWithImage(
            height: getSize(44),
            width: getSize(44),
            image: SvgPicture.asset(
              controller.toDoList[index].image,
              height: getSize(20),
            ),
            gradientContainerColor:
                controller.toDoList[index].gradientContainerColor ?? [],
          ),
        ),
        SizedBox(
          width: getSize(12),
        ),
        BaseText(
          text: controller.toDoList[index].title,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}
