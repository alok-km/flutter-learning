import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:merchant_demo_app/constants/strings.dart';
import 'package:merchant_demo_app/presentation/screens/checkout_screen/checkout_screen.dart';
import 'package:merchant_demo_app/presentation/screens/home/home_screen.dart';
import 'package:merchant_demo_app/presentation/screens/payment_success_screen/payment_success_screen.dart';
import 'package:merchant_demo_app/presentation/screens/qr_payment_screen/qr_payment_screen.dart';
import 'package:merchant_demo_app/presentation/screens/splash_screen/splash_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case "/home":
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case CHECKOUT:
        return MaterialPageRoute(builder: (_) => CheckoutScreen());
      case "/paymentSuccess":
        return MaterialPageRoute(builder: (_) => PaymentSuccessScreen());
      case "/qrPayment":
        return MaterialPageRoute(builder: (_) => QRPaymentScreen());
      default:
        return null;
    }
  }
}
