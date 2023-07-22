import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heodat/core/utils/functions.dart';
import 'package:heodat/src/router/app_pages.dart';
import 'package:heodat/src/app/pages/splash/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({this.useResponsiveWrapper = false, Key? key}) : super(key: key);
  final bool useResponsiveWrapper;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GestureDetector(
      onTap: () {
        disableFocus(context);
      },
      child: MaterialApp(
        title: 'HeoDat',
        // initialBinding: AuthBinding(),
        initialRoute: const SplashPage().route,
        debugShowCheckedModeBanner: false,
        routes: appRoutes,
      ),
    );
  }
}
