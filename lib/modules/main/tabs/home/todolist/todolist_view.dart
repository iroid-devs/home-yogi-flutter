import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/home_controller.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/todolist/widgets/task_tag_list.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/todolist/widgets/to_do_list.dart';
import 'package:home_yogi_flutter/routes/app_pages.dart';
import 'package:home_yogi_flutter/shared/constants/colors.dart';

import '../../../../../shared/constants/string_constant.dart';
import '../../../../../shared/utils/math_utils.dart';
import '../../../../../shared/widgets/base_text.dart';
import '../../../../../shared/widgets/common_app_bar.dart';

class ToDoListView extends GetView<HomeController> {
  const ToDoListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: StringConstants.titleToDoList,
        actions: [
          IconButton(
              icon: SvgPicture.asset(
                getAssetsSVGImg('add_square'),
              ),
              onPressed: () async{
                  var result = await  Get.toNamed(Routes.ADD_TASK);
                  if(result == "success"){
                    controller. getToDoList();
                  }
              }),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: _buildMainBody(),
      ),
    );
  }

  _buildMainBody() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getSize(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseText(
            text: "Ongoing task",
            fontWeight: FontWeight.w500,
            fontSize: 18,
            textColor: ColorConstants.white.withOpacity(0.6),
          ),
          SizedBox(
            height: getSize(20.0),
          ),
          ToDoList(),
          SizedBox(
            height: getSize(30.0),
          ),
          BaseText(
            text: "Task by tags",
            fontWeight: FontWeight.w500,
            fontSize: 18,
            textColor: ColorConstants.white.withOpacity(0.6),
          ),
          SizedBox(
            height: getSize(20.0),
          ),
          TaskTagList(),
        ],
      ),
    );
  }
}
