import 'dart:async';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/auth/login/sign_in_with_email/sign_in_with_email_binding.dart';
import 'package:home_yogi_flutter/modules/onboarding/onboarding_binding.dart';
import 'package:home_yogi_flutter/modules/onboarding/onboarding_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../api/api_repository.dart';
import '../../di.dart';
import '../../routes/app_pages.dart';
import '../../shared/constants/storage.dart';
import '../auth/login/sign_in_with_email/sign_in_with_email.dart';

class SplashController extends GetxController {
  final ApiRepository apiRepository;
  SplashController({required this.apiRepository});
  final prefs = Get.find<SharedPreferences>();
  startTime() async {
    Future.delayed(const Duration(seconds: 3), () {
      print("dsfsf======${prefs.getBool(StorageConstants.showOnBoarding)}");
      prefs.getString(StorageConstants.token) == null &&
              prefs.getBool(StorageConstants.showOnBoarding) == null
          ? Get.offNamed(Routes.ON_BOARDING)
          : prefs.getBool(StorageConstants.showOnBoarding) == true &&
                  prefs.getString(StorageConstants.token) == null
              ? Get.off(SignInWithEmailScreen(), binding: SignInWithEmailBindings())
              : (DenpendencyInjection.userResponse.fullname) == null
                  ? Get.offNamed(Routes.USER_DETAIL)
                  : Get.offNamed(Routes.MAIN);
    });
  }

  @override
  onInit() async {
    startTime();
    super.onInit();
  }
}
