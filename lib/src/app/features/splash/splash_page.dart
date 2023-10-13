import 'package:flutter/material.dart';
import 'package:heodat/core/utils/extensions/int_extensions.dart';
import 'package:heodat/core/widgets/heo_page.dart';
import 'package:heodat/src/app/features/home/pages/home_page.dart';
import 'package:heodat/src/app/widgets/loading_page.dart';

class SplashPage extends HeoSlPage {
  const SplashPage({super.key});

  @override
  String get route => '/splash';

  @override
  initPage(context) {
    super.initPage(context);
    Future.delayed(
      3.seconds,
      () {
        Navigator.pushReplacementNamed(context, HomePage.route);
      },
    );
  }

  @override
  Widget child(BuildContext context) {
    return const LoadingPage();
  }
}
