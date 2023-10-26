import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

class SmoothScroll extends StatelessWidget {
  const SmoothScroll({super.key, required this.scrollController, this.child});
  final ScrollController scrollController;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return WebSmoothScroll(
      animationDuration: 300,
      controller: scrollController,
      child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          controller: scrollController,
          child: child),
    );
  }
}
