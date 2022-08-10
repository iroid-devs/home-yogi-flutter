import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/checklist/checklist_binding.dart';
import 'package:home_yogi_flutter/modules/main/tabs/checklist/checklist_view.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/progress_report/progress_report_controller.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/constants/string_constant.dart';
import '../../../../../shared/utils/math_utils.dart';
import '../../../../../shared/widgets/base_text.dart';
import '../../../../../shared/widgets/common_app_bar.dart';
import '../../../../../shared/widgets/common_container_shadow.dart';
import '../../../../../shared/widgets/common_linear_progress.dart';
import '../../../../../shared/widgets/common_listtile_with_image.dart';
import '../../../../../shared/widgets/shadow_percent_indicator.dart';
import '../../../../../shared/widgets/show_coin.dart';
import '../examination/examination_view.dart';

class ProgressReportView extends GetView<ProgressReportController> {
  const ProgressReportView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Progress report',
        actions: [
          ShowCoin(
            numberText: 575,
          ),
        ],
      ),
      body: _buildMainBody(),
    );
  }

  _buildMainBody() {
    return Container(
      margin: EdgeInsets.all(
        getSize(25.0),
      ),
      child: Column(
        children: [
          _buildProgressCircle(),
          SizedBox(
            height: getSize(20.0),
          ),
          _buildCard(),
          SizedBox(
            height: getSize(20.0),
          ),
          _buildListView(),
          SizedBox(
            height: getSize(20.0),
          ),
        ],
      ),
    );
  }

  _buildProgressCircle() {
    return CirclePercentIndicatorWithShadow(
      remainingPercent: controller.args.progress ?? 0,
      totalPercent: 100,
      height: getSize(150),
      lineWigth: getSize(14),
      radius: getSize(65),
      centerContainerHeight: getSize(100),
    );
  }

  _buildCard() {
    return CommonContainerWithShadow(
      height: getSize(115),
      width: Get.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image.asset(
                  getAssetsPNGImg(
                    'coin',
                  ),
                  height: getSize(30.0),
                ),
              ),
              BaseText(
                text: controller.args.points.toString(),
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
                fontSize: 16,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getSize(40.0),
            ),
            child: BaseText(
              text:
                  "Your average score appears to be good, and you should strive for 100 percent.",
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  _buildListView() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.args.report?.length,
      itemBuilder: (BuildContext context, int index) {
        print("progressDemo ==========${controller.args.report![index].title}");
        return Padding(
          padding: EdgeInsets.only(
            bottom: getSize(20.0),
          ),
          child: CommonListTileWithImage(
            image: Image.network(
              controller.args.report![index].iconImage.toString(),
              height: getSize(50),
            ),
            // Image.asset(
            //   getAssetsPNGImg(
            //     controller.checkListModelList[index].image,
            //   ),
            //   height: getSize(50),
            // ),
            titleText: controller.args.report![index].title.toString(),
            percentage: 0,
            gradientContainerColor:
            controller.checkListModelList[index].gradientContainerColor,
            gradientBorderColor:
            controller.checkListModelList[index].gradientBorderColor,
            onClickCallback: () {
              if (controller.checkListModelList[index].titleText ==
                  StringConstants.examination) {
                Get.to(() => ExaminationView());
              } else if (controller.checkListModelList[index].titleText ==
                  StringConstants.checklist) {
                Get.to(() => CheckListView(), binding: CheckListBinding());
              }
            },
            progressBar: getLinearProgress(),
              rowWidget:_buildRow(index),
           // rowWidget: _buildRow(progressText: ("${controller.args.report![index].progress.toString()} %"),
          ),
        );
      },
    );
  }

  _buildRow(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          getAssetsPNGImg('chart_square'),
          height: 15,
        ),
        SizedBox(
          width: getSize(10.0),
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
          text: "${controller.args.report![index].progress.toString()} %",
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

  inkwellContainer() {
    return Stack(
      children: [
        Container(
          width: 100,
          height: 100,
          color: Colors.red,
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Ink(
              width: 100,
              height: 100,
            ),
          ),
        ),
      ],
    );
  }
}
