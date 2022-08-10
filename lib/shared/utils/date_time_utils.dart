import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateTimeUtils{

  openDatePicker(ValueChanged<DateTime> onDateTimeChangedCallback) {
    FocusManager.instance.primaryFocus?.unfocus();
    showCupertinoModalPopup(
        context: Get.context!,
        builder: (BuildContext builder) {
          return SizedBox(
            height: Get.size.height * 0.25,
            child: CupertinoDatePicker(
              backgroundColor: Colors.white,
              mode: CupertinoDatePickerMode.dateAndTime,
              onDateTimeChanged: onDateTimeChangedCallback,
              initialDateTime: DateTime.now(),
              minimumYear: 2010,
              maximumYear: 2025,
            ),
          );
        });
  }
}