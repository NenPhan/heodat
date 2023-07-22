import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText(this.text, {super.key, this.fontSize});
  final String text;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    if (fontSize == null) {}
    return Text(
      text,
      style: TextStyle(fontSize: fontSize),
    );
  }
}
