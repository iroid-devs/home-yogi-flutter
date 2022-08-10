import 'package:get/get.dart';

class TaskModel{
  final int id;
  final String tag;
  final String title;
  final String detail;
  final String date;
  final String time;
  final int category; // 0 = Indoor 1 = Outdoor
  RxBool isExpanded = false.obs;
  RxBool isCheck = false.obs;

  TaskModel({
      required this.id,
      required this.tag,
      required this.title,
      required this.detail,
      required this.date,
      required this.time,
      required this.category,
  });

}