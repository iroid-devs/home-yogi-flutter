import 'package:flutter/material.dart';

class ToDoListModel {
  final String title;
  final String image;
  final int total;
  final int remaining;
  final List<Color>? gradientContainerColor;

  ToDoListModel(this.title, this.image, this.total, this.remaining,
      this.gradientContainerColor);
}
