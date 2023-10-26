import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heodat/app_config.dart';
import 'package:heodat/core/config/my_theme.dart';
import 'package:heodat/core/config/my_navigator_observer.dart';
import 'package:heodat/core/utils/functions.dart';
import 'package:heodat/core/widgets/sz.dart';
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

    var screenSize = scrSize(context);
    return ScreenUtilInit(
      designSize: Size(screenSize.width, screenSize.height),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GestureDetector(
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
                navigatorKey: AppConfig.globalKey,
                title: 'HeoDat',
                initialRoute: SplashPage.route,
                debugShowCheckedModeBanner: false,
                onGenerateRoute: AppRoute.onGenerateRoute,
                theme: MyThemes.lightTheme,
                darkTheme: MyThemes.darkTheme,
                themeMode: state,
                navigatorObservers: [AppNavObserver()],
              );
            },
          ),
        ),
      ),
    );
  }
}
