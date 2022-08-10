import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/premium/book_inspection/book_inspection_detail/book_inspection_detail_controller.dart';
import '../../../../../../../../shared/constants/string_constant.dart';
import '../../../../../../../../shared/utils/math_utils.dart';
import '../../../../../../../../shared/widgets/base_text.dart';
import '../../../../../../../../shared/widgets/input_field.dart';

class ContactListWidget extends GetView<BookInspectionDetailController>{
  const ContactListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.familyContact.value,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              SizedBox(
                height: getSize(20.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BaseText(
                    text: 'Family member ${index + 1}',
                    fontSize: 14,
                    textColor: Colors.white.withOpacity(0.8),
                  ),
                  index != 0
                      ? GestureDetector(
                    onTap: () {
                      controller.removeFamilyMember(index);
                    },
                    child: SvgPicture.asset(
                      getAssetsSVGImg('trash'),
                    ),
                  )
                      : Container(),
                ],
              ),
              SizedBox(
                height: getSize(10.0),
              ),
              InputTextField(
                controller: controller.familyEmailControllerList[index],
                hintText: StringConstants.hintEmail,
                enable: true,
                prefixIcon: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    getAssetsSVGImg('email'),
                  ),
                ),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email address.';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: getSize(20.0),
              ),
              InputTextField(
                controller: controller.familyPhoneControllerList[index],
                hintText: StringConstants.hintContactNo,
                prefixText: '+1',
                inputFormatters: [
                  MaskedInputFormatter(' ###-000-####'),
                ],
                prefixIcon: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    getAssetsSVGImg('call'),
                  ),
                ),
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return StringConstants.validationContactNo;
                  }
                  return null;
                },
              ),
            ],
          );
        },
      );
    });
  }

}