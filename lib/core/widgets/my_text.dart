import 'package:flutter/material.dart';
import 'package:heodat/core/config/my_theme.dart';

class MyText extends StatelessWidget {
  const MyText(this.text, {super.key, this.style});
  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: textTheme(context).bodyMedium?.color,
      ).copyWith(
        fontSize: style?.fontSize,
        fontWeight: style?.fontWeight,
        height: style?.height,
        color: style?.color,
      ),
    );
  }
}
