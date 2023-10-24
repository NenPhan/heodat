import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heodat/src/app/widgets/loading_page.dart';
import 'package:heodat/src/app/features/home/pages/home_page.dart';
import 'package:heodat/src/app/features/splash/splash_page.dart';

class AppRoute {
  static Widget _buildScreen(RouteSettings settings, BuildContext context) {
    switch (settings.name) {
      case '/':
        return const LoadingPage();
      case SplashPage.route:
        return const SplashPage();
      case HomePage.route:
        return const HomePage();
      default:
        return const LoadingPage();
    }
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    _configUIForScreen(settings);
    return FadeTransitionRoute(
      builder: (context) => _buildScreen(settings, context),
      settings: settings,
    );
  }

  static void _configUIForScreen(RouteSettings settings) {
    if ([].contains(settings.name)) {
      // Hide status bar
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    } else {
      // Show status bar again
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.light),
      );
    }
  }
}

class FadeTransitionRoute<T> extends MaterialPageRoute<T> {
  FadeTransitionRoute({WidgetBuilder? builder, RouteSettings? settings})
      : super(
          builder: builder!,
          settings: settings,
        );

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(opacity: animation, child: child);
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);
}
