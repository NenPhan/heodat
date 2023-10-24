// ignore_for_file: must_be_immutable

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:heodat/core/config/my_navigator_observer.dart';
import 'package:heodat/core/utils/enums.dart';

class AppConfig extends InheritedWidget {
  AppConfig(
      {Key? key,
      required this.appName,
      required this.flavorName,
      required this.apiUrl,
      required this.host,
      required this.resourceIcon,
      required this.resource,
      required this.socket,
      required Widget child,
      this.logResponse = false})
      : super(key: key, child: child) {
    FlutterError.onError = (FlutterErrorDetails details) {
      if (isDevelopment) {
        FlutterError.dumpErrorToConsole(details);
      } else {
        Zone.current.handleUncaughtError(details.exception,
            details.stack ?? StackTrace.fromString("stackTraceString"));
      }
    };
  }

  final String appName;
  final AppFlavor flavorName;
  final String apiUrl;
  final String host;
  final String resource;
  final String resourceIcon;
  final String socket;
  final bool logResponse;

  OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) => const SizedBox(),
  );

  static final globalKey = GlobalKey<NavigatorState>();

  static String get currentRoute => AppNavObserver.currentRoute;

  bool get isDevelopment =>
      flavorName == AppFlavor.DEVELOPMENT ||
      flavorName == AppFlavor.STAGING_DEV;

  static AppConfig? get instance => globalKey.currentContext
      ?.dependOnInheritedWidgetOfExactType(aspect: AppConfig);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
