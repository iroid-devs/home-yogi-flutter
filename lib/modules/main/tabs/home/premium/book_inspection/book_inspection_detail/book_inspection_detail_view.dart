import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/models/response/premium/book_inspection_response.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/premium/book_inspection/book_inspection_binding.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/premium/book_inspection/book_inspection_detail/book_inspection_detail_controller.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/premium/book_inspection/book_inspection_detail/widget/available_date_widget.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/premium/book_inspection/book_inspection_detail/widget/contact_list_widget.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/premium/book_inspection/book_inspection_view.dart';
import 'package:home_yogi_flutter/shared/shared.dart';

import '../../../../../../../shared/utils/math_utils.dart';
import '../../../../../../../shared/widgets/base_elevated_button.dart';
import '../../../../../../../shared/widgets/base_text.dart';
import '../../../../../../../shared/widgets/common_app_bar.dart';
import '../../../../../../../shared/widgets/common_container_shadow.dart';
import '../book_inspection_confirm/book_inspection_confirm_binding.dart';
import '../book_inspection_confirm/book_inspection_confirm_view.dart';
import '../book_inspection_controller.dart';

class BookInspectionDetailView extends GetView<BookInspectionDetailController> {
  BookInspectionResponse bookInspectionResponse;
  BookInspectionDetailView({Key? key , required this.bookInspectionResponse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Book inspection',
      ),
      body: SingleChildScrollView(
        child: _buildMainBody(),
        physics: BouncingScrollPhysics(),
      ),
    );
  }

  _buildMainBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: BaseText(
            text: '${bookInspectionResponse.name} inspection',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            textColor: ColorConstants.white.withOpacity(0.8),
          ),
        ),
        Container(
          margin: EdgeInsets.all(
            getSize(20.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              AvailableDateWidget(),

              SizedBox(
                height: getSize(20.0),
              ),
              BaseText(
                text: '+ Add special notes:',
                fontSize: 14,
              ),
              SizedBox(
                height: getSize(10.0),
              ),
              InputTextField(
                controller: TextEditingController(),
                hintText: 'special notes',
                maxLines: 2,
                textInputType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
              ),
              SizedBox(
                height: getSize(20.0),
              ),
              Center(
                child: BaseText(
                  text: 'Add your reminders',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  textColor: Colors.white.withOpacity(0.94),
                ),
              ),
              SizedBox(
                height: getSize(10.0),
              ),
              CommonContainerWithShadow(
                padding: EdgeInsets.symmetric(
                  horizontal: getSize(20.0),
                  vertical: getSize(15.0),
                ),
                width: double.maxFinite,
                child: BaseText(
                  text: 'You will be contacted 4X before each exam',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  textColor: Colors.white.withOpacity(0.94),
                ),
              ),
              SizedBox(
                height: getSize(20.0),
              ),
              BaseText(
                text: '+ Add contact methods:',
                fontSize: 14,
                textColor: Colors.white.withOpacity(0.94),
              ),
              SizedBox(
                height: getSize(20.0),
              ),
              InputTextField(
                controller: controller.userEmailController,
                hintText: StringConstants.hintEmail,
                enable: false,
                prefixIcon: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    getAssetsSVGImg('email'),
                  ),
                ),
                textInputAction: TextInputAction.next,
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter email address.';
                //   }
                //   return null;
                // },
              ),
              SizedBox(
                height: getSize(20.0),
              ),
              InputTextField(
                controller: controller.userPhoneController,
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
              SizedBox(
                height: getSize(20.0),
              ),
              BaseText(
                text: 'Need family / friends to receive notifications:',
                fontSize: 14,
                textColor: Colors.white.withOpacity(0.94),
              ),

              //_buildFamilyContactList(),
              ContactListWidget(),

              Obx(() {
                return controller.familyContact < 3
                    ? GestureDetector(
                        onTap: () {
                          controller.addFamilyMember();
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: getSize(20.0)),
                          width: double.maxFinite,
                          child: BaseText(
                            text: '+ Add below',
                            textAlign: TextAlign.right,
                            fontSize: 14,
                            textColor: ColorConstants.progressColor,
                          ),
                        ),
                      )
                    : Container();
              }),
              _buildConfirmButton(),
            ],
          ),
        ),
      ],
    );
  }

  _buildConfirmButton() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getSize(30.0),
      ),
      child: BaseElevatedButton(
        width: double.maxFinite,
        child: BaseText(
          text: 'CONFIRM',
          fontWeight: FontWeight.w700,
        ),
        onPressed: () {
          Get.to(BookInspectionConfirmView(),
          binding:BookInspectionConfirmBinding(),);
         // Get.back();
          // if (controller.formKey.currentState!.validate()) {
          //   Get.back();
          // }
        },
      ),
    );
  }
}
