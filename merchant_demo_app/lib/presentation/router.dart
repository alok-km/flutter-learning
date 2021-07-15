import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:merchant_demo_app/presentation/screens/splash_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => SplashScreen());
      // case HOME_SCREEN:
      //   return MaterialPageRoute(builder: (_) => PostDataScreen());
      default:
        return null;
    }
  }
}
