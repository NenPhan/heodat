import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heodat/core/utils/classes/heo_color.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  final bool systemDark;
  ThemeCubit(this.systemDark) : super(systemDark ? ThemeMode.dark : ThemeMode.light) {
    updateStatusBarTheme();
  }

  updateThemeMode() {
    emit(state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
    updateStatusBarTheme();
  }

  updateStatusBarTheme() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: state == ThemeMode.dark ? HeoColor.mainColor : HeoColor.bgr1,
      statusBarIconBrightness: state == ThemeMode.dark ? Brightness.light : Brightness.dark,
      systemNavigationBarColor: state == ThemeMode.dark ? HeoColor.mainColor : HeoColor.bgr1,
      systemNavigationBarIconBrightness: state == ThemeMode.dark ? Brightness.light : Brightness.dark,
    ));
  }
}

TextTheme textTheme(context) => Theme.of(context).textTheme;
ThemeData theme(context) => Theme.of(context);

class HeoThemes {
  static final darkTheme = ThemeData(
    primarySwatch: getMaterialColor(HeoColor.mainColorList[0]),
    primaryColor: HeoColor.mainColor,
    scaffoldBackgroundColor: HeoColor.bgr1Dark,
    cardColor: HeoColor.bgr2Dark,
    appBarTheme: AppBarTheme(
      systemOverlayStyle:
          SystemUiOverlayStyle(statusBarColor: HeoColor.mainColorList[0], statusBarIconBrightness: Brightness.light),
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      titleLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
  );

  static final lightTheme = ThemeData(
    primarySwatch: getMaterialColor(HeoColor.mainColor),
    primaryColor: HeoColor.mainColor,
    scaffoldBackgroundColor: HeoColor.bgr1,
    cardColor: HeoColor.bgr2,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: HeoColor.bgr1, statusBarIconBrightness: Brightness.dark),
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: HeoColor.mainColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: HeoColor.mainColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: HeoColor.mainColor,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: HeoColor.mainColor,
      ),
      titleLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: HeoColor.mainColor,
      ),
    ),
  );
}
