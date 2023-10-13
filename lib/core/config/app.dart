import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heodat/core/config/heo_theme.dart';
import 'package:heodat/core/utils/functions.dart';
import 'package:heodat/src/app/features/splash/splash_page.dart';
import 'package:heodat/src/router/app_pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({this.useResponsiveWrapper = false, Key? key}) : super(key: key);
  final bool useResponsiveWrapper;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    var brightness = MediaQuery.of(context).platformBrightness;
    bool systemDarkMode = brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        disableFocus(context);
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>(
            create: (context) => ThemeCubit(systemDarkMode),
          ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, state) {
            return MaterialApp(
              title: 'HeoDat',
              // initialBinding: AuthBinding(),
              initialRoute: const SplashPage().route,
              debugShowCheckedModeBanner: false,
              routes: appRoutes,
              theme: HeoThemes.lightTheme,
              darkTheme: HeoThemes.darkTheme,
              themeMode: state,
            );
          },
        ),
      ),
    );
  }
}
