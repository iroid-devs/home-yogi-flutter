import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/auth/login/sign_in_with_email/sign_in_with_email_controller.dart';
import 'package:home_yogi_flutter/modules/auth/login/user_detail/user_detail_binding.dart';
import 'package:home_yogi_flutter/modules/auth/login/user_detail/user_detail_screen.dart';
import 'package:home_yogi_flutter/shared/constants/common_otp_textfield.dart';
import 'package:home_yogi_flutter/shared/shared.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import '../../../../../../shared/dialog/email_verify_dialog.dart';
import '../../../../../../shared/utils/math_utils.dart';
import '../../../../../../shared/widgets/base_elevated_button.dart';
import '../../../../../../shared/widgets/common_boxshadow.dart';
import '../../../../helper/login_network.dart';

class SignInWithEmailScreen extends GetView<SignInWithEmailController> {
  const SignInWithEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildMainBody(),
    );
  }

  _buildMainBody() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(Get.context!).requestFocus(FocusNode());
      },
      child: Obx(() {
        return Form(
          key: controller.formKey,
          child: Padding(
            padding: EdgeInsets.only(
              left: getSize(30),
              right: getSize(30),
              bottom: getSize(40),
              top: getSize(50),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: BaseText(
                    //textAlign: TextAlign.center,
                    text: "Get started",
                    fontSize: 32,
                  ),
                ),
                SizedBox(
                  height: getSize(40),
                ),
                _buildEmailView(),
                SizedBox(
                  height: getSize(40),
                ),
                _buildOtpView(),
                Spacer(),
                // SizedBox(
                //   height: getSize(),
                // ),
                _buttonSendVerifyOTP(),
              ],
            ),
          ),
        );
      }),
    );
  }

  _buildEmailView() {
    return IgnorePointer(
      ignoring: (!controller.sendOtpView.value &&
          controller.resendOtpTime.value != 0),
      child: Opacity(
        opacity: (!controller.sendOtpView.value &&
                controller.resendOtpTime.value != 0) ? 1
            : 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BaseText(
              text: 'Email Address',
              textColor: Colors.white,
            ),
            SizedBox(
              height: getSize(12),
            ),
            Focus(
              onFocusChange: (hasFocus) {
                if (hasFocus) {
                  controller.sendOtpView.value = true;
                  if (controller.isValidEmail()) {
                    controller.buttonClickable.value = true;
                  }
                }
              },
              child: InputTextField(
                controller: controller.emailController,
                hintText: 'Enter email address',
                onChanged: (value) {
                  controller.emailValue.value = value;
                  if (controller.isValidEmail()) {
                    controller.buttonClickable.value = true;
                  } else {
                    controller.buttonClickable.value = false;
                  }
                },
                enable: true,
                prefixIcon: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    getAssetsSVGImg('email'),
                  ),
                ),
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.emailAddress,
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please email address.';
                //   }
                //   return null;
                // },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildOtpView() {
    return IgnorePointer(
      ignoring: controller.sendOtpView.value,
      child: Opacity(
        opacity: controller.sendOtpView.value ? 0.2 : 1,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BaseText(
                  text: 'Enter OTP',
                  textColor: Colors.white,
                ),
                BaseText(
                  text: controller.showResendTime(),
                  //text: '${double.parse((controller.start.value).toStringAsFixed(2))}',
                  textColor: Colors.white,
                ),
              ],
            ),
            SizedBox(
              height: getSize(14),
            ),
           // opacity: controller.resendOtpTime.value == 0 ? 0.4 : 1,
            Opacity(
              opacity: controller.resendOtpTime.value == 0 ? 0.6 : 1,
              child: Center(
                child: AbsorbPointer(
                  absorbing: controller.resendOtpTime.value == 0 ? true : false,
                  child: CommonOTPTextField(
                    controller: controller.otpController,
                    length: 5,
                    isDense: true,
                    width: Get.size.width,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 52,
                    otpFieldStyle: OtpFieldStyle(
                      borderColor: Colors.grey.withOpacity(0.10),
                      enabledBorderColor: Colors.grey.withOpacity(0.10),
                      focusBorderColor: Colors.grey.withOpacity(0.10),
                      backgroundColor: ColorConstants.darkContainerBlack,
                    ),
                    fieldStyle: FieldStyle.box,
                    outlineBorderRadius: 14,
                    style: TextStyle(
                      color: ColorConstants.white,
                      fontSize: 24,
                      shadows: [
                        CommonBoxShadow.getBlackBackgroundBoxShadow(
                          Offset(5, 6),
                        ),
                      ],
                    ),
                    onChanged: (pin) {
                      print("Changed: " + pin);
                      controller.otpValue.value = pin;
                      if (controller.otpValue.value.length < 5) {
                        controller.buttonClickable.value = false;
                      }
                    },
                    onCompleted: (pin) {
                      print("Completed: " + pin);
                      controller.buttonClickable.value = true;
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: getSize(14),
            ),
            Opacity(
              opacity: controller.resendOtpTime.value == 0 ? 1 : 0.2,
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: (controller.resendOtpTime.value == 0 &&
                          controller.sendOtpView.value == false)
                      ? () {
                          controller.loginUser();
                        }
                      : null,
                  child: BaseText(
                    //textAlign: TextAlign.end,
                    text: 'Resend OTP?',
                    textColor: ColorConstants.blueShadow,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buttonSendVerifyOTP() {
    return Opacity(
      opacity: controller.buttonClickable.value ? 1 : 0.2,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getSize(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BaseElevatedButton(
              onPressed: !controller.buttonClickable.value
                  ? null
                  : () {
                      FocusManager.instance.primaryFocus?.unfocus();

                      if (controller.sendOtpView.value) {
                        controller.loginUser();
                      } else {
                        controller.otpVerify();
                        //   controller.timer?.cancel();
                        //showEmailVerifyDialog();
                      }
                    },
              child: BaseText(
                isUpperCase: true,
                text: controller.sendOtpView.value
                    ? StringConstants.sendOtp
                    : StringConstants.verifyOtp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  showEmailVerifyDialog() {
    Get.dialog(
      EmailVerifyDialog(
        email: controller.emailValue.string,
        continueCallBack: () {
          Get.back();
          Get.offAll(
            UserDetailScreen(),
            binding: UserDetailBindings(),
          );
        },
      ),
      barrierDismissible: false,
    );
  }
}
