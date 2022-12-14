import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'en_US.dart';
import 'pt_BR.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static final fallbackLocale = Locale('en', 'US');
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'pt_BR': ptBR,
      };
}
