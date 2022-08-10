import 'package:flutter/material.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';

class GradientText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Gradient gradient;

  const GradientText(
      {Key? key, required this.text, this.fontSize, required this.gradient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: BaseText(text: text, fontSize: fontSize ?? 16),
    );
  }
}
