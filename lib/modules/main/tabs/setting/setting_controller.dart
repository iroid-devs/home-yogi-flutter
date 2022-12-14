import 'dart:convert';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/api/api_repository.dart';
import 'package:home_yogi_flutter/modules/main/tabs/setting/model/setting_model.dart';
import 'package:home_yogi_flutter/shared/constants/string_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../models/response/auth/user_detail_response.dart';
import '../../../../routes/app_pages.dart';
import '../../../../shared/constants/storage.dart';
import 'edit_profile/edit_profile_controller.dart';

class SettingController extends GetxController {
  final ApiRepository repository;
  UserDetailResponse userDetailResponse = UserDetailResponse();
  final prefs = Get.find<SharedPreferences>();
  SettingController({required this.repository});
  var data1 = Get.put(EditProfileController);
  //var title = "Setting".obs;

  RxBool switchValue = false.obs;
  String name = '';
  String image = '';
  EditProfileController editProfileController =
      Get.put(EditProfileController(repository: Get.find()));

  List<SettingModel> settingList = [
    SettingModel(
        icon: 'notification_bing', title: StringConstants.pushNotification),
    SettingModel(icon: 'star', title: StringConstants.planAndBilling),
    SettingModel(icon: 'crown', title: StringConstants.referAndEarn),
    SettingModel(icon: 'voice_assistants', title: StringConstants.voiceSupport),
    SettingModel(icon: 'shield_tick', title: StringConstants.termsAndCondition),
    SettingModel(icon: 'logout', title: StringConstants.signOut),
  ];

  getUsersData() async {
    final prefs = Get.find<SharedPreferences>();
    if (prefs.getString(StorageConstants.userData) != null) {
      userDetailResponse = UserDetailResponse.fromJson(
        jsonDecode(prefs.getString(StorageConstants.userData)!),
      );
      name = userDetailResponse.fullname.toString();
      image = userDetailResponse.profileImage.toString();
    }
  }

  // loginOutUser() async {
  //   var get = await repository.logOut({
  //     "deviceId": "G4urR2TanUp92389lpvcN9a3",
  //   });
  //   print("getLogOut${get?.dioMessage}");
  // }

  void logOutUser() async {
    try {
      final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
      String? deviceId;
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
        deviceId = androidDeviceInfo.id;
        printInfo(info: 'deviceId123 ==> $deviceId');
      } else if (Platform.isIOS) {
        IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
        deviceId = iosDeviceInfo.identifierForVendor;
      }

      printInfo(info: 'deviceId ==> $deviceId');
      if (deviceId != null) {
        var commonResponse = await repository.logOut({'deviceId': deviceId});
        printInfo(info: 'commonResponse ==> $commonResponse');
        if (commonResponse?.dioMessage != null) {
          // final prefs = Get.find<SharedPreferences>();
          await prefs.clear();
          await prefs.setBool(StorageConstants.showOnBoarding, true);
          Get.offAllNamed(Routes.SIGNIN);
        }
      }
    } catch (ex) {
      printInfo(info: 'error ==> ${ex.toString()}');
    }
  }

  @override
  void onInit() {
    getUsersData();
    //loginOutUser();
    super.onInit();
  }
}
