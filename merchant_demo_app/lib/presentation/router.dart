import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:merchant_demo_app/constants/strings.dart';
import 'package:merchant_demo_app/presentation/screens/checkout_screen/checkout_screen.dart';
import 'package:merchant_demo_app/presentation/screens/splash_screen/splash_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case CHECKOUT:
        return MaterialPageRoute(builder: (_) => CheckoutScreen());
      default:
        return null;
    }
  }
}
