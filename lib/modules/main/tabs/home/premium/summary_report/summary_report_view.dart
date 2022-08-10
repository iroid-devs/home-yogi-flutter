import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/premium/summary_report/model/summary_report_model.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/premium/summary_report/summary_report_controller.dart';
import 'package:home_yogi_flutter/shared/constants/colors.dart';
import 'package:home_yogi_flutter/shared/constants/png_image_constant.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';
import 'package:home_yogi_flutter/shared/widgets/common_app_bar.dart';
import 'package:home_yogi_flutter/shared/widgets/common_container_shadow.dart';

import '../../../../../../shared/utils/math_utils.dart';

class SummaryReportView extends GetView<SummaryReportController> {
  const SummaryReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: "Summary report",
      ),
      body: _buildMainBody(),
    );
  }

  _buildMainBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getSize(24)),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          CommonContainerWithShadow(
            child: Padding(
              padding: EdgeInsets.all(
                getSize(18),
              ),
              child: BaseText(
                textAlign: TextAlign.center,
                text:
                    "Here is the summarised chart of your various housing parts",
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(
            height: getSize(30),
          ),
          BaseText(
            text: "Summary",
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.summaryReportModel.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:  EdgeInsets.only(top: getSize(20),),
                child: CommonContainerWithShadow(
                  child: Padding(
                    padding: EdgeInsets.all(getSize(12)),
                    child: Column(
                      children: [
                        BaseText(
                          text: controller.summaryReportModel[index].titleText,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(
                          height: getSize(12),
                        ),
                        Image.asset(
                          controller.summaryReportModel[index].image,
                          height: getSize(130),
                          width: getSize(310),
                        ),
                        SizedBox(
                          height: getSize(12),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: getSize(6),),
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              commonRowTextView(
                                  text: 'Problem : ',
                                  subText:
                                  controller.summaryReportModel[index].problemText),
                              SizedBox(
                                height: getSize(10),
                              ),
                              commonRowTextView(
                                  text: 'Condition : ',
                                  subText:
                                  controller.summaryReportModel[index].conditionText),
                              SizedBox(
                                height: getSize(10),
                              ),
                              BaseText(
                                text: controller.summaryReportModel[index].recommendedText,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(
                                height: getSize(20),
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    PngImageConstants.tips_image,
                                    height: getSize(13),
                                  ),
                                  SizedBox(
                                    width: getSize(8),
                                  ),
                                  BaseText(
                                    text: "Tips :",
                                    fontSize: 14,
                                    textColor: ColorConstants.white.withOpacity(0.8),
                                  ),
                                  BaseText(
                                    text: controller.summaryReportModel[index].tipsText,
                                    fontSize: 14,
                                    textColor: ColorConstants.white.withOpacity(0.8),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  commonRowTextView({required String text, required String subText}) {
    return Row(
      children: [
        BaseText(
          text: text,
          fontSize: 14,
          textColor: ColorConstants.white.withOpacity(0.8),
        ),
        BaseText(
          text: subText,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
