import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/shared/shared.dart';
import 'package:home_yogi_flutter/shared/widgets/base_elevated_button.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../../shared/constants/png_image_constant.dart';
import '../../../../../shared/utils/math_utils.dart';
import '../../../../../shared/widgets/circle_progress_indicator.dart';
import '../../../../../shared/widgets/common_app_bar.dart';
import '../../../../../shared/widgets/common_container_shadow.dart';
import 'edit_profile_controller.dart';

class EditProfileScreen extends GetView<EditProfileController> {
  const EditProfileScreen({Key? key}) : super(key: key);

  final double topMargin = 12.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: StringConstants.titleEditProfile,
      ),
      body: SingleChildScrollView(
        child: _buildMainBody(),
        physics: BouncingScrollPhysics(),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getSize(30.0),
          vertical: getSize(30.0),
        ),
        child: BaseElevatedButton(
          width: double.maxFinite,
          child: BaseText(
            text: 'SAVE',
            fontWeight: FontWeight.w700,
          ),
          onPressed: () {
            if (controller.formKey.currentState!.validate()) {
              controller.updateProfileDetails();
              Get.back();
            }
          },
        ),
      ),
    );
  }

  _buildMainBody() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: getSize(30.0),
        vertical: getSize(0.0),
      ),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileView(),
            SizedBox(
              height: getSize(20.0),
            ),
            BaseText(
              text: StringConstants.labelUsername,
              fontSize: 12,
              textColor: Colors.white,
            ),
            SizedBox(
              height: getSize(topMargin),
            ),
            InputTextField(
              controller: controller.usernameController,
              hintText: StringConstants.hintUsername,
              prefixIcon: Padding(
                padding: EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  getAssetsSVGImg('profile'),
                ),
              ),
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.name,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return StringConstants.validationUsername;
                }
                return null;
              },
            ),
            SizedBox(
              height: getSize(20.0),
            ),
            BaseText(
              text: StringConstants.labelEmail,
              textColor: Colors.white,
              fontSize: 12,
            ),
            SizedBox(
              height: getSize(topMargin),
            ),
            InputTextField(
              controller: controller.emailController,
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
            BaseText(
              text: StringConstants.labelContactNo,
              textColor: Colors.white,
              fontSize: 12,
            ),
            SizedBox(
              height: getSize(topMargin),
            ),
            InputTextField(
              controller: controller.phoneController,
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
                if(value.length < 10){
                  return 'please enter valid number';
                }
                return null;
              },
            ),
            SizedBox(
              height: getSize(20.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BaseText(
                  text: StringConstants.address,
                  fontSize: 12,
                  textColor: Colors.white,
                ),
                GestureDetector(
                  onTap: () async {
                    String address = await Get.toNamed(Routes.googleMap);
                    controller.locationController.text = address;
                  },
                  child: BaseText(
                    text: StringConstants.editOnMap,
                    fontSize: 12,
                    textColor: ColorConstants.progressColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getSize(topMargin),
            ),
            InputTextField(
              onTap: () {
                controller.locationController.text;
                controller.locationValue.value;
              },
              controller: controller.locationController,
              hintText: StringConstants.hintLocation,
              prefixIcon: Padding(
                padding: EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  getAssetsSVGImg('location'),
                ),
              ),
              textInputAction: TextInputAction.newline,
              textInputType: TextInputType.multiline,
              maxLines: 2,
              readOnly: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return StringConstants.validationLocation;
                }
                return null;
              },
            ),
            SizedBox(
              height: getSize(40.0),
            ),
          ],
        ),
      ),
    );
  }

  _buildProfileView() {
    return Container(
      margin: EdgeInsets.only(top: getSize(20.0)),
      width: double.maxFinite,
      //color: Colors.pink[50],
      //height: 200,
      child: Center(
        child: Stack(
          children: [
            Obx(() {
              print(
                  "controller.pickedImagePath.value.......${controller.pickedImagePath.value}");
              print("Hellooooo");
              return BaseCircleProgressIndicator(
                radius: 55.0,
                percent: 0.75,
                lineWidth: 6.0,
                imagePath: controller.pickedImagePath.value,
                // imageUrl : controller.userDetailResponse.profileImage,
              );
            }),
            Positioned(
              child: _buildEditButton(),
              bottom: 0,
              right: 0,
            ),
          ],
        ),
      ),
    );
  }

  _buildEditButton() {
    return GestureDetector(
      onTap: () async {
        showImageChooserDialog();
      },
      child: CommonContainerWithShadow(
        height: getSize(40),
        width: getSize(40),
        cornerRadius: 20,
        child: Padding(
          padding: EdgeInsets.all(
            getSize(10.0),
          ),
          child: SvgPicture.asset(
            getAssetsSVGImg('edit'),
          ),
        ),
      ),
    );
  }

  showImageChooserDialog() {
    showCupertinoModalPopup<void>(
      context: Get.context!,
      builder: (BuildContext context) => CupertinoActionSheet(
        // title: const BaseText(
        //   text: "",
        //   textAlign: TextAlign.center,
        // ),
        // message: const Text('Message'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            child: const BaseText(
              text: StringConstants.takePhoto,
            ),
            onPressed: () {
              Get.back();
              controller.pickImage(imageSource: ImageSource.camera);
            },
          ),
          CupertinoActionSheetAction(
            child: const BaseText(
              text: StringConstants.galleryPhoto,
            ),
            onPressed: () {
              Get.back();
              controller.pickImage(imageSource: ImageSource.gallery);
            },
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: const BaseText(
            text: StringConstants.buttonCancel,
            fontSize: 18,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
    );
  }
}
