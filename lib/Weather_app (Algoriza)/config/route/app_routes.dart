import 'package:flutter/material.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/strings.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/pages/weather_home_screen.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/splaash/presentation/screens/splash_screen.dart';


class Routes {
  static const String initialRoute = '/';
  static const String currentweather = '/currentweather';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) {
          return const SplashScreen();
        });

      case Routes.currentweather:
        return MaterialPageRoute(builder: ((context) {
          return  WeatherHomeScreen();
        }));
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
          body: Center(
            child: Text(AppStrings.noRouteFound),
          ),
        )));
  }
}
