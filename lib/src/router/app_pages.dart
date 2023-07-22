import 'package:heodat/src/app/pages/home/home_page.dart';
import 'package:heodat/src/app/pages/splash/splash_page.dart';

get appRoutes => {
      const SplashPage().route: (context) => const SplashPage(),
      HomePage.route: (context) => const HomePage(),
    };
