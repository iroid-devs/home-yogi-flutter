import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/level/show_level_rank/show_level_controller.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/level/show_level_rank/widgets/show_top_level_user.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/level/show_level_rank/widgets/show_user_level_list.dart';
import 'package:home_yogi_flutter/shared/constants/colors.dart';
import 'package:home_yogi_flutter/shared/constants/png_image_constant.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';
import 'package:home_yogi_flutter/shared/widgets/common_app_bar.dart';
import 'package:home_yogi_flutter/shared/widgets/common_boxshadow.dart';
import 'package:home_yogi_flutter/shared/widgets/show_coin.dart';

import '../../../../../../shared/utils/math_utils.dart';

class ShowLevelRankScreen extends GetView<ShowLevelController> {
  const ShowLevelRankScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Top home yogis',
        actions: [
          ShowCoin(
            numberText: 575,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: ShowTopLevelUserPage(),
          ),
          Expanded(
            flex: 3,
            child: ShowUserLevelListView(),
          ),
          SizedBox(
            height: getSize(10),
          )
        ],
      ),
    );
  }
}
