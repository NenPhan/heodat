import 'package:flutter/material.dart';
import 'package:heodat/core/config/my_theme.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({super.key, this.width, this.height});
  final double? width, height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: theme(context).cardColor,
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
