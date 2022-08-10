import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/level/show_level_rank/show_level_controller.dart';
import 'package:home_yogi_flutter/shared/constants/colors.dart';
import 'package:home_yogi_flutter/shared/constants/png_image_constant.dart';
import 'package:home_yogi_flutter/shared/utils/math_utils.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';

class ShowTopLevelUserPage extends GetView<ShowLevelController> {
  const ShowTopLevelUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => mainBodyView(),
      ),
    );
  }

  Stack mainBodyView() {
    return Stack(
      alignment: Alignment.center,
      children: [
        backgroundImageView(),
        mainTop3ImageList(),
      ],
    );
  }

  Center mainTop3ImageList() {
    return Center(
      child: ListView.builder(
        itemCount: controller.showTop3LevelRankMdel.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        primary: false,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return mainImageView(index);
        },
      ),
    );
  }

  Padding mainImageView(int index) {
    return Padding(
      padding: index == 1
          ? EdgeInsets.symmetric(horizontal: getSize(35))
          : EdgeInsets.only(top: getSize(40)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          medalImageView(index),
          SizedBox(
            height: getSize(18),
          ),
          mainCenterImageView(index),
          SizedBox(
            height: getSize(24),
          ),
          userNameView(index),
          SizedBox(
            height: getSize(6),
          ),
          userRankView(index)
        ],
      ),
    );
  }

  Row userRankView(int index) {
    return Row(
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
          text: controller.showTop3LevelRankMdel[index].coin,
          fontSize: 10,
        )
      ],
    );
  }

  BaseText userNameView(int index) {
    return BaseText(
      text: controller.showTop3LevelRankMdel[index].name,
      fontSize: 12,
    );
  }

  Stack mainCenterImageView(int index) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: index == 1 ? getSize(120) : getSize(80),
          width: index == 1 ? getSize(120) : getSize(80),
          decoration: BoxDecoration(
            boxShadow: index == 1
                ? [
                    BoxShadow(
                      color: ColorConstants.yellow.withOpacity(0.6),
                      blurRadius: 30,
                      offset: Offset(0, 0),
                    ),
                  ]
                : [],
            gradient: LinearGradient(
              colors: controller.showTop3LevelRankMdel[index].colors ??
                  [ColorConstants.blueShadow, ColorConstants.blueShadow],
            ),
            shape: BoxShape.circle,
          ),
          child: Padding(
            //this padding will be you border size
            padding: EdgeInsets.all(getSize(3)),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              child: CircleAvatar(
                // radius: getSize(55),
                backgroundImage:
                    AssetImage(controller.showTop3LevelRankMdel[index].image),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: getSize(-10),
          child: CircleAvatar(
            backgroundColor: controller.getTop3RankContainerColor(index),
            radius: getSize(14),
            child: BaseText(
              text: controller.showTop3LevelRankMdel[index].rank,
              textAlign: TextAlign.center,
              fontSize: 14,
              textColor: ColorConstants.black,
            ),
          ),
        )
      ],
    );
  }

  Image medalImageView(int index) {
    return Image.asset(
      controller.showTop3LevelRankMdel[index].medal,
      height: getSize(60),
      alignment: Alignment.center,
      width: getSize(40),
    );
  }

  Opacity backgroundImageView() {
    return Opacity(
      opacity: 0.2,
      child: Image.asset(
        PngImageConstants.level_background,
        alignment: Alignment.center,
        width: getSize(230),
      ),
    );
  }
}
