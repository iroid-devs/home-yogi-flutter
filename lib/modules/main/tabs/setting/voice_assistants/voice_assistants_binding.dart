import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/setting/voice_assistants/voice_assistants_controller.dart';

class VoiceAssistantsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<VoiceAssistantsController>(
          () => VoiceAssistantsController(),
    );
  }

}