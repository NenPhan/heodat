import 'package:flutter/material.dart';
import 'package:heodat/core/utils/classes/asset.dart';
import 'package:heodat/core/utils/classes/heo_color.dart';
import 'package:heodat/core/widgets/heo_page.dart';
import 'package:heodat/core/widgets/sz.dart';
import 'package:lottie/lottie.dart';

class LoadingPage extends HeoSlPage {
  const LoadingPage({super.key});

  @override
  Widget child(BuildContext context) {
    return Scaffold(
      body: Container(
        color: HeoColor.mainColorList[3],
        child: Center(
          child: sz(w: scrSize(context).width * 0.3, child: Lottie.asset(Assets.lotties.wallet)),
        ),
      ),
    );
  }
}
