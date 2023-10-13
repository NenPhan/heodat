import 'package:heodat/src/app/widgets/loading_page.dart';
import 'package:heodat/src/app/features/home/pages/home_page.dart';
import 'package:heodat/src/app/features/splash/splash_page.dart';

get appRoutes => {
      '/': (context) => const LoadingPage(),
      const SplashPage().route: (context) => const SplashPage(),
      HomePage.route: (context) => const HomePage(),
    };
