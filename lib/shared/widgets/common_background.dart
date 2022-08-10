import 'package:flutter/material.dart';

class CommonBackground extends StatelessWidget {
  final Widget child;
  const CommonBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(),
      ),
    );
  }
}
