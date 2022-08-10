import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/home_controller.dart';
import 'package:home_yogi_flutter/shared/constants/constants.dart';
import 'package:home_yogi_flutter/shared/utils/math_utils.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';
import 'package:home_yogi_flutter/shared/widgets/common_container_shadow.dart';
import 'package:home_yogi_flutter/shared/widgets/common_linear_progress.dart';
import 'package:home_yogi_flutter/shared/widgets/gradiant_container_with_image.dart';

import '../../../../../models/response/home/to_do_list_response.dart';
import '../../../../../routes/app_pages.dart';
import '../todolist/models/to_do_list_model.dart';
import 'package:get/get.dart';

class ToDoListWidget extends GetView<HomeController> {
  const ToDoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.toDoListResponse.value.onGoingTask?.length != null
          ? ListView.builder(
              itemCount: controller.toDoListResponse.value.onGoingTask?.length,
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                print(
                    "demo=================${controller.toDoListResponse.value.onGoingTask![index].totalTasks.toString()}");
                return Padding(
                  padding: EdgeInsets.only(
                      left: index == 0 ? getSize(24) : 0, right: getSize(20)),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(
                      getSize(14),
                    ),
                    onTap: () {
                      OnGoingTask onGoingTask = controller.toDoListResponse.value.onGoingTask![index];
                      Map<String,dynamic> argumentMap = {
                        'viewType':1,
                        'model':onGoingTask,
                      };
                      // ToDoListModel toDoListModel = controller.toDoList[index];
                      //Get.toNamed(Routes.TASK_CATEGORY, arguments: controller.toDoListResponse.value.onGoingTask![index]);
                      Get.toNamed(Routes.TASK_CATEGORY, arguments: argumentMap);
                    },
                    child: CommonContainerWithShadow(
                      width: getSize(145),
                      backgroundColor: ColorConstants.toListBlack,
                      child: Column(
                        children: [
                          getImageTileView(index),
                          SizedBox(
                            height: getSize(6),
                          ),
                          getText(index),
                          SizedBox(
                            height: getSize(6),
                          ),
                          getLinearProgress(index),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          : Container(),
    );
  }

  Padding getLinearProgress(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getSize(14.0)),
      child: CommonLinearProgressWidget(
        width: getSize(115),
        remaining: controller
            .toDoListResponse.value.onGoingTask![index].totalCompletedTasks!
            .toDouble(),
        total: controller.toDoListResponse.value.onGoingTask![index].totalTasks!
            .toDouble(),
      ),
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
                "${controller.toDoListResponse.value.onGoingTask![index].totalCompletedTasks}/${controller.toDoListResponse.value.onGoingTask![index].totalTasks}",
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
            image: Image.network(
              controller.toDoListResponse.value.onGoingTask![index].iconImage
                  .toString(),
              height: getSize(20),
            ),

            // SvgPicture.asset(
            //   controller.toDoList[index].image,
            //   height: getSize(20),
            // ),
            gradientContainerColor:
                controller.toDoList[index].gradientContainerColor ?? [],
          ),
        ),
        SizedBox(
          width: getSize(12),
        ),
        BaseText(
          text: controller.toDoListResponse.value.onGoingTask![index].title
              .toString(),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}
