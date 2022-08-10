import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/premium/book_inspection/book_inspection_detail/book_inspection_detail_controller.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../shared/constants/colors.dart';
import '../../../../../../../../shared/utils/date_time_utils.dart';
import '../../../../../../../../shared/utils/math_utils.dart';
import '../../../../../../../../shared/widgets/base_text.dart';
import '../../../../../../../../shared/widgets/common_container_shadow.dart';

class AvailableDateWidget extends GetView<BookInspectionDetailController> {
  const AvailableDateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonContainerWithShadow(
          padding: EdgeInsets.symmetric(
            horizontal:getSize(20.0),
            vertical: getSize(15.0),
          ),
          child: BaseText(
            text: 'If you want to change the proposed date, these are the dates available:',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            textColor: ColorConstants.white.withOpacity(0.94),
          ),
        ),
        SizedBox(
          height: getSize(20.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BaseText(
              text: 'Date / Time',
              fontSize: 14,
              textColor: Colors.white.withOpacity(0.94),
            ),
            GestureDetector(
              onTap: () {
                DateTimeUtils().openDatePicker((value) {
                  String formattedDate = DateFormat('dd MM yyyy').format(value);
                  controller.inspectionDate.value = formattedDate;
                });
              },
              child: BaseText(
                text: 'Edit',
                fontSize: 14,
                textColor: ColorConstants.progressColor,
              ),
            ),
          ],
        ),
        SizedBox(
          height: getSize(10.0),
        ),
        CommonContainerWithShadow(
          padding: EdgeInsets.symmetric(
            horizontal: getSize(20.0),
            vertical: getSize(10.0),
          ),
          height: getSize(70),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Obx(() {
                return BaseText(
                  text: controller.inspectionDate.value,
                  fontSize: 24,
                  textColor: Colors.white.withOpacity(0.94),
                );
              }),
              VerticalDivider(
                color: Colors.white.withOpacity(0.3),
                thickness: 2,
              ),
              BaseText(
                text: '9:00 AM',
                fontSize: 24,
                textColor: Colors.white.withOpacity(0.94),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
