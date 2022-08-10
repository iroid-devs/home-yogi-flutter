import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/premium/account_manager/account_manager_controller.dart';

class AccountManagerBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<AccountManagerController>(() => AccountManagerController());
  }
}