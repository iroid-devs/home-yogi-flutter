import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/models/response/home/check_list_details_response.dart';
import 'package:home_yogi_flutter/modules/main/tabs/checklist/category/category_controller.dart';
import 'package:home_yogi_flutter/shared/constants/constants.dart';
import 'package:home_yogi_flutter/shared/constants/margin.dart';
import 'package:home_yogi_flutter/shared/dialog/congrats_dialog.dart';
import 'package:home_yogi_flutter/shared/utils/math_utils.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';
import 'package:home_yogi_flutter/shared/widgets/common_container_shadow.dart';
import '../../../../../shared/constants/gradiant_color.dart';
import '../../../../../shared/widgets/common_app_bar.dart';
import '../../../../../shared/widgets/gradiant_container_with_image.dart';
import '../../../../../shared/widgets/show_coin.dart';
import 'model/subtask.dart';
import 'model/task.dart';

class CheckListCategoryView extends GetView<CheckListCategoryController> {
  //final String title;
  const CheckListCategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Get.arguments,
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
      margin: EdgeInsets.all(MarginConstant.marginAll),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseText(
            text: StringConstants.ongoing,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            textColor: ColorConstants.white.withOpacity(0.6),
          ),
          SizedBox(
            height: getSize(20.0),
          ),
          Obx(
            () => controller.checkListDetailsResponse.value.onGoingChecklists !=
                    null
                ? _buildOnGoingList()
                : Container(),
          ),
          SizedBox(
            height: getSize(20.0),
          ),
          BaseText(
            text: StringConstants.completed,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            textColor: ColorConstants.white.withOpacity(0.6),
          ),
          SizedBox(
            height: getSize(20.0),
          ),
          Obx(
            () =>
                controller.checkListDetailsResponse.value.completedChecklists !=
                        null
                    ? _buildCompletedList()
                    : Container(),
          ),
        ],
      ),
    );
  }

  // Build Ongoing Task List
  _buildOnGoingList() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount:
          controller.checkListDetailsResponse.value.onGoingChecklists?.length,
      itemBuilder: (BuildContext context, int index) {
        OnGoingChecklists taskModel =
            controller.checkListDetailsResponse.value.onGoingChecklists![index];
        return _buildTaskListItem(taskModel, index);
        // Task taskModel = controller.taskList[index];
        // if (!taskModel.isCompleted.value) {
        //   return _buildTaskListItem(taskModel, index);
        // } else {
        //   return Container();
        // }
      },
    );
  }

  // Build Completed Task List
  _buildCompletedList() {
    // controller.taskList[3].isCompleted.value = true;
    // controller.taskList[4].isCompleted.value = true;

    return Opacity(
      opacity: 0.2,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller
            .checkListDetailsResponse.value.completedChecklists?.length,
        itemBuilder: (BuildContext context, int index) {
          OnGoingChecklists taskModel = controller
              .checkListDetailsResponse.value.completedChecklists![index];
          return _buildTaskListItem(taskModel, index);
          // if (taskModel.isCompleted.value) {
          //   return _buildTaskListItem(taskModel, index);
          // } else {
          //   return Container();
          // }
        },
      ),
    );
  }

  // Build Task List item
  _buildTaskListItem(OnGoingChecklists task, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Opacity(
        opacity: 1.0,
        child: CommonContainerWithShadow(
          child: _buildExpansionTile(task, index),
        ),
      ),
    );
  }

  _buildExpansionTile(OnGoingChecklists task, int index) {
    final theme = Get.theme.copyWith(
      dividerColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
    );
    controller.incrementGradiantColorIndex();

    return ListTileTheme(
      //contentPadding: EdgeInsets.all(0),
      //dense: true,
      horizontalTitleGap: 0.0,
      minLeadingWidth: 0,
      child: Theme(
        data: theme,
        child: ExpansionTile(
          iconColor: ColorConstants.white,
          childrenPadding: EdgeInsets.all(0.0),
          title: Row(
            children: [
              GradiantContainerWithImage(
                width: 45,
                height: 45,
                image: Image.asset(
                  getAssetsPNGImg('checklist_all'),
                  height: getSize(40),
                ),
                gradientBorderColor:
                    GradientColor().colorsList[controller.gradiantColorIndex],
                gradientContainerColor:
                    GradientColor().colorsList[controller.gradiantColorIndex],
              ),
              SizedBox(
                width: getSize(20.0),
              ),
              BaseText(
                text: task.name ?? "",
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Image.asset(
                      getAssetsPNGImg(
                        'coin',
                      ),
                    ),
                  ),
                  BaseText(
                    text:
                        "+${task.points}",
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
          /* trailing: Obx(() {
            return Container(
              child: controller.customTileExpanded.value
                  ? SvgPicture.asset(getAssetsSVGImg('arrow_up1'),)
                  : SvgPicture.asset(getAssetsSVGImg('arrow_down1'),),
            );
          }),*/
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: getSize(10.0),
                    right: getSize(10.0),
                    top: getSize(10.0),
                  ),
                  child: Divider(
                    height: 1,
                    color: ColorConstants.white.withOpacity(0.3),
                  ),
                ),
                _buildSubTaskList(task.checklistOptions ?? [], false, index),
              ],
            ),
          ],
          onExpansionChanged: (bool expanded) {
            controller.customTileExpanded.value = expanded;
          },
        ),
      ),
    );
  }

  // Build Sub Task List
  _buildSubTaskList(
      List<ChecklistOptions> subTaskList, bool isCompleted, int index) {
    // print("checkListCategorey......................${controller.checkListDetailsResponse.value.onGoingChecklists![1].checklistOptions![index].toJson()}");
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: subTaskList.length,
      itemBuilder: (context, index) {
        return _buildSubTaskListItem(
          subTask: subTaskList[index],
          index: index,
            completed: isCompleted,
            subTaskList: subTaskList
        );
      },
    );
  }

  // Build Sub Task List Item
  _buildSubTaskListItem({
    required ChecklistOptions subTask,
    required int index,
    completed = false,
    required List<ChecklistOptions> subTaskList,
  }) {

    var completed = false.obs;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      //padding: isCompleted?EdgeInsets.all(getSize(5.0)):null,
      // height: 25,
      child: Obx(
        () {
          if (completed.value) {
            subTask.isChecked.value = true;
          }
          return ListTile(
            dense: true,
            contentPadding: EdgeInsets.all(0.0),
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            horizontalTitleGap: getSize(10.0),
            leading: InkWell(
              child: Opacity(
                opacity: subTask.isChecked.value ? 0.6 : 1.0,
                child: subTask.isChecked.value
                    ? SvgPicture.asset(
                        getAssetsSVGImg('tick_square'),
                      )
                    : SvgPicture.asset(
                        getAssetsSVGImg('untick_square'),
                      ),
              ),
              //onTap: completed ? null: _onTap(subTask,subTaskList),
              onTap: () {
                if (!(completed.value) && subTask.checklistOptionId != null) {
                  controller.getCheckListChecked(subTask.checklistOptionId!);
                  // controller.getCheckListChecked(controller
                  //         .checkListDetailsResponse
                  //         .value
                  //         .onGoingChecklists?[index]
                  //         .checklistOptions?[index]
                  //         .checklistOptionId ??
                  //     0);
                  controller.changeView(subTask);
                  if (controller.checkTaskCompleted(subTaskList)){
                    _showCongratsDialog();
                    controller.getCheckListDetails();
                  }
                  // if (controller.checkTaskCompleted(controller.checkListDetailsResponse.value.onGoingChecklists![index].checklistOptions!)){
                  //   _showCongratsDialog();
                  // }
                }
              },
            ),
            title: BaseText(
              textAlign: TextAlign.start,
              text: subTask.option ?? "",
              style: subTask.isChecked.value
                  ? TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: ColorConstants.white.withOpacity(0.6),
                      fontSize: 12,
                    )
                  : TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 12,
                    ),
            ),
          );
        },
      ),
    );
  }

  _showCongratsDialog() {
    Get.dialog(
      CongratsDialog(
        coin: 2,
        continueCallBack: () {
          Get.back();
        },
        offerText: 'You have successfully completed checklist',
      ),
    );
    /*showDialog(
      barrierColor: Colors.black26,
      context: Get.context!,
      builder: (context) {
        return CongratsDialog(
          continueCallBack: () {
            Get.back();
          },
        );
      },
    );*/
  }
}

// class CheckListCategoryView extends GetView<CheckListCategoryController> {
//   //final String title;
//   const CheckListCategoryView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: BaseAppBar(
//         title: Get.arguments,
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
//       margin: EdgeInsets.all(MarginConstant.marginAll),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           BaseText(
//             text: StringConstants.ongoing,
//             fontSize: 12,
//             fontWeight: FontWeight.w600,
//             textColor: ColorConstants.white.withOpacity(0.6),
//           ),
//           SizedBox(
//             height: getSize(20.0),
//           ),
//           _buildOnGoingList(),
//           SizedBox(
//             height: getSize(20.0),
//           ),
//           BaseText(
//             text: StringConstants.completed,
//             fontSize: 12,
//             fontWeight: FontWeight.w600,
//             textColor: ColorConstants.white.withOpacity(0.6),
//           ),
//           SizedBox(
//             height: getSize(20.0),
//           ),
//           _buildCompletedList(),
//         ],
//       ),
//     );
//   }
//
//   // Build Ongoing Task List
//   _buildOnGoingList() {
//     return ListView.builder(
//       physics: NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       itemCount: controller.taskList.length,
//       itemBuilder: (BuildContext context, int index) {
//         Task taskModel = controller.taskList[index];
//         if (!taskModel.isCompleted.value) {
//           return _buildTaskListItem(taskModel);
//         } else {
//           return Container();
//         }
//       },
//     );
//   }
//
//   // Build Completed Task List
//   _buildCompletedList() {
//     controller.taskList[3].isCompleted.value = true;
//     controller.taskList[4].isCompleted.value = true;
//
//     return ListView.builder(
//       physics: NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       itemCount: controller.taskList.length,
//       itemBuilder: (BuildContext context, int index) {
//         Task taskModel = controller.taskList[index];
//         if (taskModel.isCompleted.value) {
//           return _buildTaskListItem(taskModel);
//         } else {
//           return Container();
//         }
//       },
//     );
//   }
//
//   // Build Task List item
//   _buildTaskListItem(Task task) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 20.0),
//       child: Opacity(
//         opacity: task.isCompleted.value ? 0.5 : 1.0,
//         child: CommonContainerWithShadow(
//           child: _buildExpansionTile(task),
//         ),
//       ),
//     );
//   }
//
//   _buildExpansionTile(Task task) {
//     final theme = Get.theme.copyWith(
//       dividerColor: Colors.transparent,
//       splashColor: Colors.transparent,
//       highlightColor: Colors.transparent,
//       hoverColor: Colors.transparent,
//     );
//     controller.incrementGradiantColorIndex();
//
//     return ListTileTheme(
//       //contentPadding: EdgeInsets.all(0),
//       //dense: true,
//       horizontalTitleGap: 0.0,
//       minLeadingWidth: 0,
//       child: Theme(
//         data: theme,
//         child: ExpansionTile(
//           iconColor: ColorConstants.white,
//           childrenPadding: EdgeInsets.all(0.0),
//           title: Row(
//             children: [
//               GradiantContainerWithImage(
//                 width: 45,
//                 height: 45,
//                 image: Image.asset(
//                   getAssetsPNGImg('checklist_all'),
//                   height: getSize(40),
//                 ),
//                 gradientBorderColor: GradientColor().colorsList[controller.gradiantColorIndex],
//                 gradientContainerColor: GradientColor().colorsList[controller.gradiantColorIndex],
//               ),
//               SizedBox(
//                 width: getSize(20.0),
//               ),
//               BaseText(
//                 text: task.title,
//                 fontSize: 14,
//                 fontWeight: FontWeight.w500,
//               ),
//               Spacer(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 8.0),
//                     child: Image.asset(
//                       getAssetsPNGImg(
//                         'coin',
//                       ),
//                     ),
//                   ),
//                   BaseText(
//                     text: '+2',
//                     fontWeight: FontWeight.w500,
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           /* trailing: Obx(() {
//             return Container(
//               child: controller.customTileExpanded.value
//                   ? SvgPicture.asset(getAssetsSVGImg('arrow_up1'),)
//                   : SvgPicture.asset(getAssetsSVGImg('arrow_down1'),),
//             );
//           }),*/
//           children: [
//             Column(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(
//                     left: getSize(10.0),
//                     right: getSize(10.0),
//                     top: getSize(10.0),
//                   ),
//                   child: Divider(
//                     height: 1,
//                     color: ColorConstants.white.withOpacity(0.3),
//                   ),
//                 ),
//                 _buildSubTaskList(task.subTaskList, task.isCompleted.value),
//               ],
//             ),
//           ],
//           onExpansionChanged: (bool expanded) {
//             controller.customTileExpanded.value = expanded;
//           },
//         ),
//       ),
//     );
//   }
//
//   // Build Sub Task List
//   _buildSubTaskList(List<SubTask> subTaskList, bool isCompleted) {
//     return ListView.builder(
//       physics: const NeverScrollableScrollPhysics(),
//       scrollDirection: Axis.vertical,
//       shrinkWrap: true,
//       itemCount: subTaskList.length,
//       itemBuilder: (context, index) {
//         return _buildSubTaskListItem(
//             subTask: subTaskList[index],
//             completed: isCompleted,
//             subTaskList: subTaskList);
//       },
//     );
//   }
//
//   // Build Sub Task List Item
//   _buildSubTaskListItem(
//       {required SubTask subTask,
//         completed = false,
//         required List<SubTask> subTaskList}) {
//     if (completed) {
//       subTask.isCompleted.value = true;
//     }
//
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 15.0),
//       //padding: isCompleted?EdgeInsets.all(getSize(5.0)):null,
//       // height: 25,
//
//       child: Obx(
//             () {
//           return ListTile(
//             dense: true,
//             contentPadding: EdgeInsets.all(0.0),
//             visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//             horizontalTitleGap: getSize(10.0),
//             leading: InkWell(
//               child: Opacity(
//                 opacity: subTask.isCompleted.value ? 0.6 : 1.0,
//                 child: subTask.isCompleted.value
//                     ? SvgPicture.asset(
//                   getAssetsSVGImg('tick_square'),
//                 )
//                     : SvgPicture.asset(
//                   getAssetsSVGImg('untick_square'),
//                 ),
//               ),
//               //onTap: completed ? null: _onTap(subTask,subTaskList),
//               onTap: () {
//                 if (!completed) {
//                   controller.changeView(subTask);
//                   if (controller.checkTaskCompleted(subTaskList)) {
//                     _showCongratsDialog();
//                   }
//                 }
//               },
//             ),
//             title: BaseText(
//               textAlign: TextAlign.start,
//               text: subTask.title,
//               style: subTask.isCompleted.value
//                   ? TextStyle(
//                 decoration: TextDecoration.lineThrough,
//                 color: ColorConstants.white.withOpacity(0.6),
//                 fontSize: 12,
//               )
//                   : TextStyle(
//                 decoration: TextDecoration.none,
//                 fontSize: 12,
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   _showCongratsDialog() {
//     Get.dialog(
//       CongratsDialog(
//         coin: 2,
//         continueCallBack: () {
//           Get.back();
//         },
//         offerText: 'You have successfully completed checklist',
//       ),
//     );
//
//     /*showDialog(
//       barrierColor: Colors.black26,
//       context: Get.context!,
//       builder: (context) {
//         return CongratsDialog(
//           continueCallBack: () {
//             Get.back();
//           },
//         );
//       },
//     );*/
//   }
// }
