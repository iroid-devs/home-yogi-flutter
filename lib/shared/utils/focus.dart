import 'package:flutter/cupertino.dart';

class AppFocus {
  static void unFocus(/*BuildContext context*/) {
    // FocusScopeNode currentFocus = FocusScope.of(context);
    //
    // if (!currentFocus.hasPrimaryFocus) {
    //   currentFocus.unfocus();

      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

