import 'package:flutter/material.dart';
import 'package:heodat/core/utils/classes/asset.dart';
import 'package:heodat/core/utils/classes/heo_color.dart';
import 'package:heodat/core/utils/extensions/int_extensions.dart';
import 'package:heodat/core/widgets/my_page.dart';
import 'package:heodat/core/widgets/sz.dart';
import 'package:heodat/src/app/pages/home/home_page.dart';
import 'package:heodat/src/router/nav.dart';
import 'package:rive/rive.dart';

class SplashPage extends MyPage {
  const SplashPage({super.key});

  @override
  String get route => '/splash';

  @override
  initPage(context) {
    super.initPage(context);
    Future.delayed(
      5.seconds,
      () {
        Nav.pushNamed(context, HomePage.route);
      },
    );
  }

  @override
  Widget child(BuildContext context) {
    return Scaffold(
        body: Container(
            color: HeoColor.bgr,
            child: Center(child: sz(w: scrSize(context).width * 0.3, child: RiveAnimation.asset(Assets.rives.piggy)))));
  }
}
