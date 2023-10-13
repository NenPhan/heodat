import 'package:flutter/material.dart';
import 'package:heodat/core/utils/classes/heo_color.dart';

class HeoText extends StatelessWidget {
  const HeoText(this.text, {super.key, this.style});
  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: HeoColor.textDark,
      ).copyWith(
        fontSize: style?.fontSize,
        fontWeight: style?.fontWeight,
        height: style?.height,
        color: style?.color,
      ),
    );
  }
}
