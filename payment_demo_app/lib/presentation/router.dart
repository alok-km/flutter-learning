import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payment_demo_app/presentation/screens/wait_for_received_url/wait_for_retrieval.dart';
import 'screens/splash_screen/splash_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => SplashScreen());
      // case "/home":
      //   return MaterialPageRoute(builder: (_) => HomeScreen());
      case "/wait":
        return MaterialPageRoute(builder: (_) => WaitForReceivedUrlScreen());
      // case CHECKOUT:
      //   return MaterialPageRoute(builder: (_) => AppToAppCheckoutScreen());
      default:
        return null;
    }
  }
}
