import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/api/api_repository.dart';
import 'package:home_yogi_flutter/shared/constants/constants.dart';
import 'package:home_yogi_flutter/shared/constants/png_image_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingController extends GetxController {
  final ApiRepository repository;
  final prefs = Get.find<SharedPreferences>();
  OnboardingController(this.repository);
  final pageViewController = PageController();
  var currentPage = 0.obs;
  var introImages = [
    PngImageConstants.intro_spring,
    PngImageConstants.intro_summer,
    PngImageConstants.intro_fall,
    PngImageConstants.intro_winter,
    PngImageConstants.splashHome,
  ].obs;
  var titles = [
    StringConstants.spring,
    StringConstants.summer,
    StringConstants.fall,
    StringConstants.winter,
    StringConstants.homeYogi,
  ].obs;
  var routineCount = ["60", "40", "50", "70", ''].obs;
}
