import 'package:flutter/material.dart';
import 'package:heodat/core/utils/classes/app_color.dart';
import 'package:heodat/core/utils/classes/asset.dart';
import 'package:heodat/core/widgets/my_page.dart';
import 'package:heodat/core/widgets/sz.dart';
import 'package:lottie/lottie.dart';

class LoadingPage extends MySlPage {
  const LoadingPage({super.key});

  @override
  Widget child(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).extension<AppColors>()!.splashBgr,
        child: Center(
          child: sz(
              w: (scrSize(context).width + scrSize(context).height) / 2 * 0.4,
              child: Lottie.asset(Assets.lotties.wallet)),
        ),
      ),
    );
  }
}
