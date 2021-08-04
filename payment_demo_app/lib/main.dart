import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_demo_app/presentation/router.dart';

void main() {
  runApp(PaymentDemoApp(router: AppRouter()));
}

class PaymentDemoApp extends StatelessWidget {
  PaymentDemoApp({Key? key, required this.router}) : super(key: key);
  final AppRouter router;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
    );
  }
}
