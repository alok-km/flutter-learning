import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screens/home/home_screen.dart';
import 'screens/splash_screen/splash_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case "/home":
        return MaterialPageRoute(builder: (_) => HomeScreen());
      // case CHECKOUT:
      //   return MaterialPageRoute(builder: (_) => AppToAppCheckoutScreen());
      default:
        return null;
    }
  }
}
