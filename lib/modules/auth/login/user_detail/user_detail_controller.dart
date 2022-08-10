import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../api/api_repository.dart';
import '../../../../models/response/auth/user_detail_response.dart';
import '../../../../shared/constants/storage.dart';
import 'package:get/get.dart';

import '../../../../shared/dialog/congrats_dialog.dart';
import '../plan_subscription/plan_subscription_binding.dart';
import '../plan_subscription/plan_subscription_screen.dart';

class UserDetailController extends GetxController {
  final ApiRepository repository;
  UserDetailController({required this.repository});
  UserDetailResponse userDetailResponse = UserDetailResponse();
  RxBool visible = true.obs;
  var userNameValue = ''.obs;
  var locationValue = ''.obs;
  var referralValue = ''.obs;
  TextEditingController userNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController referralController = TextEditingController();
  final prefs = Get.find<SharedPreferences>();

  updateUserDetails() async {
    final formData = FormData({
      "fullname": userNameController.text,
      "address": locationController.text,
      "latitude": "54.26385",
      "longitude": "30.26385",
    });
    if (referralController.text.isNotEmpty) {
      formData.fields.add(
        MapEntry("referralCode", referralController.text),
      );
    }
    var updateUserRes = await repository.updateUserDetail(formData
        // "fullname": userNameController.text,
        // "referralCode": "EG4GL0HE3",
        // "address": locationController.text,
        // "latitude": "54.26385",
        // "longitude": "30.26385",
        );
    print("userId${updateUserRes.userId}");
    if (updateUserRes.userId != null) {
      userDetailResponse = updateUserRes;
      await prefs.setString(
          StorageConstants.userData, jsonEncode(updateUserRes.toJson()));
      showCongratsDialog();
    }
  }

  showCongratsDialog() {
    showDialog(
      barrierColor: Colors.black26,
      context: Get.context!,
      builder: (context) {
        return CongratsDialog(
          continueCallBack: () {
            Get.back();
            Get.to(
              PlanSubscriptionScreen(),
              binding: PlanAndSubscriptionBindings(),
            );
          },
          coin: userDetailResponse.points ?? 00, offerText: 'You earned these points for logging in for \nthe first time.',
        );
      },
    );
  }
}
