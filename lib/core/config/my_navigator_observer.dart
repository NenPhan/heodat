import 'package:flutter/material.dart';

class AppNavObserver extends NavigatorObserver {
  static String _currentRoute = '/';
  static String get currentRoute => _currentRoute;

  @override
  void didPop(Route route, Route? previousRoute) {
    if (previousRoute != null) {
      _setCurrentRoute(previousRoute);
    }
    super.didPop(route, previousRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    _setCurrentRoute(route);
    super.didPush(route, previousRoute);
  }

  void _setCurrentRoute(Route<dynamic> route) {
    if (route.settings.name != null) {
      _currentRoute = route.settings.name!;
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    if (newRoute != null) {
      _setCurrentRoute(newRoute);
    }
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    if (previousRoute != null) {
      _setCurrentRoute(previousRoute);
    }
    super.didRemove(route, previousRoute);
  }
}
