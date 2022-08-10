import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/todolist/addtask/add_task_controller.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/todolist/addtask/models/task_model.dart';
import 'package:home_yogi_flutter/shared/utils/date_time_utils.dart';
import 'package:home_yogi_flutter/shared/utils/math_utils.dart';
import 'package:intl/intl.dart';
import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/constants/string_constant.dart';
import '../../../../../../shared/widgets/base_elevated_button.dart';
import '../../../../../../shared/widgets/base_text.dart';
import '../../../../../../shared/widgets/common_app_bar.dart';
import '../../../../../../shared/widgets/common_container_shadow.dart';
import '../../../../../../shared/widgets/input_field.dart';

class AddTaskView extends GetView<AddTaskController> {
  const AddTaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var today = new DateTime(now.year, now.month, now.day);
    //TaskModel? taskModel;
    // final Object? object = ModalRoute.of(context)?.settings.arguments;
    // if (object != null) {
    //   taskModel = object as TaskModel;
    //   controller.setData(taskModel);
    // }

    return Scaffold(
      appBar: BaseAppBar(
        title: controller.taskId == null
            ? StringConstants.titleAddTask
            : StringConstants.titleEditTask,
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
        getSize(20.0),
      ),
      child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            _buildTagsView(),
            SizedBox(
              height: getSize(25.0),
            ),
            _buildTitleView(),
            SizedBox(
              height: getSize(25.0),
            ),
            _buildDetailView(),
            SizedBox(
              height: getSize(25.0),
            ),
            _buildDateView(),
            SizedBox(
              height: getSize(25.0),
            ),
            _buildTimeView(),
            SizedBox(
              height: getSize(15.0),
            ),
            _buildRadioButtonsView(),
            SizedBox(
              height: getSize(50.0),
            ),
            _buildCreateTaskButton(),
          ],
        ),
      ),
    );
  }

  _buildTitleView() {
    return InputTextField(
      controller: controller.textEditingTitleController,
      textInputAction: TextInputAction.newline,
      hintText: 'Title',
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter title.';
        }
        return null;
      },
    );
  }

  _buildDetailView() {
    return InputTextField(
      controller: controller.textEditingDetailController,
      hintText: 'Add Details',
      textInputType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      maxLines: 8,
      minLines: 7,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter details.';
        }
        return null;
      },
    );
  }

  _buildDateView() {
    return InkWell(
      borderRadius: BorderRadius.circular(
        getSize(14),
      ),
      onTap: () => _showDatePicker(),
      child: Obx(
        () {
          return InputTextField(
            controller: controller.textEditingDateController.value,
            hintText: 'DD/MM/YYYY',
            enable: false,
            prefixIcon: SvgPicture.asset(
              getAssetsSVGImg('calendar'),
              fit: BoxFit.scaleDown,
            ),
          );
        },
      ),
    );
  }

  _showDatePicker() {
    var now = DateTime.now();
    var today = new DateTime(now.month, now.day);
    FocusManager.instance.primaryFocus?.unfocus();
    showCupertinoModalPopup(
      context: Get.context!,
      builder: (BuildContext builder) {
        return Container(
          height: Get.size.height * 0.25,
          color: Colors.white,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 16.0, top: 10.0),
                    child: BaseText(
                      text: "Done",
                      textColor: ColorConstants.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,),
                  ),
                ),
              ),
              Flexible(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (value) {
                    controller.selectedDate = value;
                    String formattedDate = DateFormat('dd-MM-yyyy').format(value);

                    controller.textEditingDateController.value.text = formattedDate;
                    print(value.year);
                  },
                  initialDateTime: DateTime.now(),
                  minimumDate: now,
                  // minimumYear: DateTime.now().year,
                  // maximumYear: 2025,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _showTimePicker() {
    final now = DateTime.now();
    FocusManager.instance.primaryFocus?.unfocus();
    showCupertinoModalPopup(
      context: Get.context!,
      builder: (BuildContext builder) {
        return Container(
          height: Get.size.height * 0.26,
          color: Colors.white,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 16.0, top: 10.0),
                    child: BaseText(
                      text: "Done",
                      textColor: ColorConstants.black,
                      fontWeight: FontWeight.w500,
                    fontSize: 20,),
                  ),
                ),
              ),
              Flexible(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  onDateTimeChanged: (value) {
                    controller.selectedTime = value;
                    String formattedTime = DateFormat.jm().format(value);
                    controller.textEditingTimeController.value.text =
                        formattedTime;
                    // printInfo(
                    //     info:
                    //         'DateTimeMillisecond : ${value.millisecondsSinceEpoch}');
                  },
                  initialDateTime: DateTime.now(),
                  minimumDate: now,
                  use24hFormat: false,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _buildTimeView() {
    return InkWell(
      borderRadius: BorderRadius.circular(
        getSize(14),
      ),
      onTap: () => _showTimePicker(),
      child: Obx(() {
        return InputTextField(
          controller: controller.textEditingTimeController.value,
          hintText: 'Set reminder',
          enable: false,
          prefixIcon: SvgPicture.asset(
            getAssetsSVGImg('timer'),
            fit: BoxFit.scaleDown,
          ),
        );
      }),
    );
    /*  return CommonContainerWithShadow(
      child: ListTile(
        horizontalTitleGap: 0,
        onTap: () => showTimePicker(),
        leading: SvgPicture.asset(
          getAssetsSVGImg('timer'),
        ),
        title: Obx(() {
          return BaseText(
            text: controller.taskTime.value,
            textColor: ColorConstants.white.withOpacity(0.6),
          );
        }),
      ),
    );*/
  }

  _buildCreateTaskButton() {
    return BaseElevatedButton(
      width: double.maxFinite,
      child: BaseText(
        text: controller.taskId == null ? 'CREATE TASK' : 'SAVE',
        fontWeight: FontWeight.w700,
      ),
      onPressed: () {
        if (controller.formKey.currentState!.validate()) {
          String validationError = controller.validation();
          printInfo(info: 'validationError = $validationError');
          if (validationError.isEmpty) {
            Get.back(result: "success");
            controller.taskId != null
                ? controller.updateTaskDetails(
                    controller.toDoListTaskDetailsResponse.value.taskId ?? 0)
                : controller.getAddTask();

          } else {
            Get.snackbar('validation', validationError);
          }
          // controller.taskId != null
          //     ? controller.updateTaskDetails(controller.toDoListTaskDetailsResponse.value.taskId ?? 0)
          //     : controller.getAddTask();
        }
      },
    );
  }

  _buildRadioButtonsView() {
    /* return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Obx(() {
              return ListTile(
                onTap: () {
                  if (!controller.isInDoor.value) {
                    controller.radioButtonCheck(index: 0);
                  }
                },
                horizontalTitleGap: 0,
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                leading: SvgPicture.asset(
                  controller.isInDoor.value
                      ? getAssetsSVGImg('radio_circle_fill')
                      : getAssetsSVGImg('radio_circle'),
                ),
                title: Opacity(
                  opacity: controller.isInDoor.value ? 1.0 : 0.6,
                  child: BaseText(
                    text: 'Indoor',
                  ),
                ),
              );
            }),
          ),
          Flexible(
            flex: 2,
            child: Obx(() {
              return ListTile(
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                onTap: () {
                  if (!controller.isOutDoor.value) {
                    controller.radioButtonCheck(index: 1);
                  }
                },
                horizontalTitleGap: 0,
                leading: SvgPicture.asset(
                  controller.isOutDoor.value
                      ? getAssetsSVGImg('radio_circle_fill')
                      : getAssetsSVGImg('radio_circle'),
                ),
                title: Opacity(
                  opacity: controller.isOutDoor.value ? 1.0 : 0.6,
                  child: BaseText(
                    text: 'Outdoor',
                  ),
                ),
              );
            }),
          ),
          //SizedBox(width: getSize(100.0),),
        ],
    );*/

    return Obx(() {
      return Row(
        children: <Widget>[
          SizedBox(
            width: 10.0,
          ),
          InkWell(
            onTap: () {
              if (!controller.isInDoor.value) {
                controller.radioButtonCheck(index: 0);
              }
            },
            child: Padding(
              padding: EdgeInsets.only(
                left: getSize(10.0),
                top: getSize(10.0),
                bottom: getSize(10.0),
                right: getSize(10.0),
              ),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset(
                    controller.isInDoor.value
                        ? getAssetsSVGImg('radio_circle_fill')
                        : getAssetsSVGImg('radio_circle'),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Opacity(
                    opacity: controller.isInDoor.value ? 1.0 : 0.6,
                    child: BaseText(
                      text: 'Indoor',
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          InkWell(
            onTap: () {
              if (!controller.isOutDoor.value) {
                controller.radioButtonCheck(index: 1);
              }
            },
            child: Padding(
              padding: EdgeInsets.only(
                left: getSize(10.0),
                top: getSize(10.0),
                bottom: getSize(10.0),
                right: getSize(10.0),
              ),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset(
                    controller.isOutDoor.value
                        ? getAssetsSVGImg('radio_circle_fill')
                        : getAssetsSVGImg('radio_circle'),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Opacity(
                    opacity: controller.isOutDoor.value ? 1.0 : 0.6,
                    child: BaseText(
                      text: 'Outdoor',
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      );
    });
  }

  _buildTagsView() {
    final theme = Get.theme.copyWith(
      dividerColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
    );

    return CommonContainerWithShadow(
      child: ListTileTheme(
        horizontalTitleGap: 0.0,
        minLeadingWidth: 0,
        dense: true,
        child: Theme(
          data: theme,
          child: Obx(
            () {
              print('isTileExpanded = ${controller.isTileExpanded.value}');
              return ExpansionTile(
                initiallyExpanded: controller.isTileExpanded.value,
                onExpansionChanged: (bool expanded) {
                  print(
                      "expanded===========${controller.isTileExpanded.value}");
                  controller.isTileExpanded.value = expanded;
                },
                key: GlobalKey(),
                iconColor: ColorConstants.white,
                childrenPadding: EdgeInsets.all(0.0),
                title: BaseText(
                  text: controller.tag.value,
                  textColor: controller.tag.value == 'Tags'
                      ? ColorConstants.white.withOpacity(0.6)
                      : null,
                ),
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
                      _buildTagList(),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  _buildTagList() {
    return SizedBox(
      height: getSize(150),
      child: ListView.builder(
        //shrinkWrap: true,
        itemCount: controller.tagList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            //padding: isCompleted?EdgeInsets.all(getSize(5.0)):null,
            //height: 25,

            child: ListTile(
              onTap: () {
                controller.tag.value = controller.tagList[index];
                // controller.tagValue.value.selection =
                //     TextSelection.fromPosition(
                //   TextPosition(
                //       offset: controller
                //           .textEditingTagController.value.text.length),
                // );
                controller.isTileExpanded.value = false;
                controller.tag.value = controller.tagList[index];
                print(controller.tagList[index]);
              },
              dense: true,
              contentPadding: EdgeInsets.all(0.0),
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              horizontalTitleGap: getSize(10.0),
              title: BaseText(
                textAlign: TextAlign.start,
                text: controller.tagList[index],
              ),
            ),
          );
        },
      ),
    );
  }
}

// class AddTaskView extends GetView<AddTaskController> {
//   const AddTaskView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var now = DateTime.now();
//     var today = new DateTime(now.year, now.month, now.day);
//     TaskModel? taskModel;
//     final Object? object = ModalRoute.of(context)?.settings.arguments;
//     if (object != null) {
//       taskModel = object as TaskModel;
//       controller.setData(taskModel);
//     }
//
//     return Scaffold(
//       appBar: BaseAppBar(
//         title: taskModel == null
//             ? StringConstants.titleAddTask
//             : StringConstants.titleEditTask,
//       ),
//       body: SingleChildScrollView(
//         child: _buildMainBody(taskModel),
//         physics: BouncingScrollPhysics(),
//       ),
//     );
//   }
//
//   _buildMainBody(TaskModel? taskModel) {
//     return Container(
//       margin: EdgeInsets.all(
//         getSize(20.0),
//       ),
//       child: Form(
//         key: controller.formKey,
//         child: Column(
//           children: [
//             _buildTagsView(),
//             SizedBox(
//               height: getSize(25.0),
//             ),
//             _buildTitleView(),
//             SizedBox(
//               height: getSize(25.0),
//             ),
//             _buildDetailView(),
//             SizedBox(
//               height: getSize(25.0),
//             ),
//             _buildDateView(),
//             SizedBox(
//               height: getSize(25.0),
//             ),
//             _buildTimeView(),
//             SizedBox(
//               height: getSize(15.0),
//             ),
//             _buildRadioButtonsView(),
//             SizedBox(
//               height: getSize(50.0),
//             ),
//             _buildCreateTaskButton(taskModel),
//           ],
//         ),
//       ),
//     );
//   }
//
//   _buildTitleView() {
//     return InputTextField(
//       controller: controller.textEditingTitleController,
//       textInputAction: TextInputAction.newline,
//       hintText: 'Title',
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter title.';
//         }
//         return null;
//       },
//     );
//   }
//
//   _buildDetailView() {
//     return InputTextField(
//       controller: controller.textEditingDetailController,
//       hintText: 'Add Details',
//       textInputType: TextInputType.multiline,
//       textInputAction: TextInputAction.newline,
//       maxLines: 8,
//       minLines: 7,
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter details.';
//         }
//         return null;
//       },
//     );
//   }
//
//   _buildDateView() {
//     return InkWell(
//       borderRadius: BorderRadius.circular(
//         getSize(14),
//       ),
//       onTap: () => _showDatePicker(),
//       child: Obx(
//             () {
//           return InputTextField(
//             controller: controller.textEditingDateController.value,
//             hintText: '00/00/0000',
//             enable: false,
//             prefixIcon: SvgPicture.asset(
//               getAssetsSVGImg('calendar'),
//               fit: BoxFit.scaleDown,
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   _showDatePicker() {
//     var now = DateTime.now();
//     var today = new DateTime(now.month, now.day);
//     FocusManager.instance.primaryFocus?.unfocus();
//     showCupertinoModalPopup(
//       context: Get.context!,
//       builder: (BuildContext builder) {
//         return Container(
//           height: Get.size.height * 0.25,
//           color: Colors.white,
//           child: CupertinoDatePicker(
//             mode: CupertinoDatePickerMode.date,
//             onDateTimeChanged: (value) {
//               controller.selectedDate = value;
//               String formattedDate = DateFormat('dd-MM-yyyy').format(value);
//
//               controller.textEditingDateController.value.text = formattedDate;
//               print(value.year);
//             },
//             initialDateTime: DateTime.now(),
//             minimumDate: now,
//             // minimumYear: DateTime.now().year,
//             // maximumYear: 2025,
//           ),
//         );
//       },
//     );
//   }
//
//   _showTimePicker() {
//     final now = DateTime.now();
//     FocusManager.instance.primaryFocus?.unfocus();
//     showCupertinoModalPopup(
//         context: Get.context!,
//         builder: (BuildContext builder) {
//           return Container(
//             height: Get.size.height * 0.25,
//             color: Colors.white,
//             child: CupertinoDatePicker(
//               mode: CupertinoDatePickerMode.time,
//               onDateTimeChanged: (value) {
//                 controller.selectedTime = value;
//                 String formattedTime = DateFormat.jm().format(value);
//                 controller.textEditingTimeController.value.text = formattedTime;
//                 // printInfo(
//                 //     info:
//                 //         'DateTimeMillisecond : ${value.millisecondsSinceEpoch}');
//               },
//               initialDateTime: DateTime.now(),
//               minimumDate: now,
//               use24hFormat: false,
//             ),
//           );
//         });
//   }
//
//   _buildTimeView() {
//     return InkWell(
//       borderRadius: BorderRadius.circular(
//         getSize(14),
//       ),
//       onTap: () => _showTimePicker(),
//       child: Obx(() {
//         return InputTextField(
//           controller: controller.textEditingTimeController.value,
//           hintText: 'Set reminder',
//           enable: false,
//           prefixIcon: SvgPicture.asset(
//             getAssetsSVGImg('timer'),
//             fit: BoxFit.scaleDown,
//           ),
//         );
//       }),
//     );
//
//     /*  return CommonContainerWithShadow(
//       child: ListTile(
//         horizontalTitleGap: 0,
//         onTap: () => showTimePicker(),
//         leading: SvgPicture.asset(
//           getAssetsSVGImg('timer'),
//         ),
//         title: Obx(() {
//           return BaseText(
//             text: controller.taskTime.value,
//             textColor: ColorConstants.white.withOpacity(0.6),
//           );
//         }),
//       ),
//     );*/
//   }
//
//   _buildCreateTaskButton(TaskModel? taskModel) {
//     return BaseElevatedButton(
//       width: double.maxFinite,
//       child: BaseText(
//         text: taskModel == null ? 'CREATE TASK' : 'SAVE',
//         fontWeight: FontWeight.w700,
//       ),
//       onPressed: () {
//         controller.getAddTask();
//         if (controller.formKey.currentState!.validate()) {
//           String validationError = controller.validation();
//           printInfo(info: 'validationError = $validationError');
//           if (validationError.isEmpty) {
//             Get.back();
//           } else {
//             Get.snackbar('validation', validationError);
//           }
//         }
//       },
//     );
//   }
//
//   _buildRadioButtonsView() {
//     /* return Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Flexible(
//             child: Obx(() {
//               return ListTile(
//                 onTap: () {
//                   if (!controller.isInDoor.value) {
//                     controller.radioButtonCheck(index: 0);
//                   }
//                 },
//                 horizontalTitleGap: 0,
//                 visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//                 leading: SvgPicture.asset(
//                   controller.isInDoor.value
//                       ? getAssetsSVGImg('radio_circle_fill')
//                       : getAssetsSVGImg('radio_circle'),
//                 ),
//                 title: Opacity(
//                   opacity: controller.isInDoor.value ? 1.0 : 0.6,
//                   child: BaseText(
//                     text: 'Indoor',
//                   ),
//                 ),
//               );
//             }),
//           ),
//           Flexible(
//             flex: 2,
//             child: Obx(() {
//               return ListTile(
//                 visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//                 onTap: () {
//                   if (!controller.isOutDoor.value) {
//                     controller.radioButtonCheck(index: 1);
//                   }
//                 },
//                 horizontalTitleGap: 0,
//                 leading: SvgPicture.asset(
//                   controller.isOutDoor.value
//                       ? getAssetsSVGImg('radio_circle_fill')
//                       : getAssetsSVGImg('radio_circle'),
//                 ),
//                 title: Opacity(
//                   opacity: controller.isOutDoor.value ? 1.0 : 0.6,
//                   child: BaseText(
//                     text: 'Outdoor',
//                   ),
//                 ),
//               );
//             }),
//           ),
//           //SizedBox(width: getSize(100.0),),
//         ],
//     );*/
//
//     return Obx(() {
//       return Row(
//         children: <Widget>[
//           SizedBox(
//             width: 10.0,
//           ),
//           InkWell(
//             onTap: () {
//               if (!controller.isInDoor.value) {
//                 controller.radioButtonCheck(index: 0);
//               }
//             },
//             child: Padding(
//               padding: EdgeInsets.only(
//                 left: getSize(10.0),
//                 top: getSize(10.0),
//                 bottom: getSize(10.0),
//                 right: getSize(10.0),
//               ),
//               child: Row(
//                 children: <Widget>[
//                   SvgPicture.asset(
//                     controller.isInDoor.value
//                         ? getAssetsSVGImg('radio_circle_fill')
//                         : getAssetsSVGImg('radio_circle'),
//                   ),
//                   SizedBox(
//                     width: 10.0,
//                   ),
//                   Opacity(
//                     opacity: controller.isInDoor.value ? 1.0 : 0.6,
//                     child: BaseText(
//                       text: 'Indoor',
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 10.0,
//           ),
//           InkWell(
//             onTap: () {
//               if (!controller.isOutDoor.value) {
//                 controller.radioButtonCheck(index: 1);
//               }
//             },
//             child: Padding(
//               padding: EdgeInsets.only(
//                 left: getSize(10.0),
//                 top: getSize(10.0),
//                 bottom: getSize(10.0),
//                 right: getSize(10.0),
//               ),
//               child: Row(
//                 children: <Widget>[
//                   SvgPicture.asset(
//                     controller.isOutDoor.value
//                         ? getAssetsSVGImg('radio_circle_fill')
//                         : getAssetsSVGImg('radio_circle'),
//                   ),
//                   SizedBox(
//                     width: 10.0,
//                   ),
//                   Opacity(
//                     opacity: controller.isOutDoor.value ? 1.0 : 0.6,
//                     child: BaseText(
//                       text: 'Outdoor',
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       );
//     });
//   }
//
//   _buildTagsView() {
//     final theme = Get.theme.copyWith(
//       dividerColor: Colors.transparent,
//       splashColor: Colors.transparent,
//       highlightColor: Colors.transparent,
//       hoverColor: Colors.transparent,
//     );
//
//     return CommonContainerWithShadow(
//       child: ListTileTheme(
//         horizontalTitleGap: 0.0,
//         minLeadingWidth: 0,
//         dense: true,
//         child: Theme(
//           data: theme,
//           child: Obx(
//                 () {
//               print('isTileExpanded = ${controller.isTileExpanded.value}');
//               return ExpansionTile(
//                 onExpansionChanged: (bool expanded) {
//                   print("expanded===========${controller.isTileExpanded.value}");
//                   controller.isTileExpanded.value = expanded;
//                 },
//                 key: GlobalKey(),
//                 //initiallyExpanded: false,
//                 iconColor: ColorConstants.white,
//                 childrenPadding: EdgeInsets.all(0.0),
//                 title: BaseText(
//                   text: controller.tag.value,
//                   textColor: controller.tag.value == 'Tags'
//                       ? ColorConstants.white.withOpacity(0.6)
//                       : null,
//                 ),
//                 children: [
//                   Column(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(
//                           left: getSize(10.0),
//                           right: getSize(10.0),
//                           top: getSize(10.0),
//                         ),
//                         child: Divider(
//                           height: 1,
//                           color: ColorConstants.white.withOpacity(0.3),
//                         ),
//                       ),
//                       _buildTagList(),
//                     ],
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//   _buildTagList() {
//     return SizedBox(
//       height: getSize(150),
//       child: ListView.builder(
//         //shrinkWrap: true,
//         itemCount: controller.tagList.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Container(
//             margin: EdgeInsets.symmetric(horizontal: 15.0),
//             //padding: isCompleted?EdgeInsets.all(getSize(5.0)):null,
//             //height: 25,
//
//             child: ListTile(
//               onTap: () {
//                 controller.tag.value = controller.tagList[index];
//                 // controller.tagValue.value.selection =
//                 //     TextSelection.fromPosition(
//                 //   TextPosition(
//                 //       offset: controller
//                 //           .textEditingTagController.value.text.length),
//                 // );
//                 controller.isTileExpanded.value = false;
//                 controller.tag.value = controller.tagList[index];
//                 print(controller.tagList[index]);
//               },
//               dense: true,
//               contentPadding: EdgeInsets.all(0.0),
//               visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//               horizontalTitleGap: getSize(10.0),
//               title: BaseText(
//                 textAlign: TextAlign.start,
//                 text: controller.tagList[index],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
