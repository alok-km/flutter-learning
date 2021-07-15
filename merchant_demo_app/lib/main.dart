import 'package:flutter/material.dart';
import 'presentation/router.dart';

void main() {
  runApp(
    MerchantDemoApp(
      router: AppRouter(),
    ),
  );
}

class MerchantDemoApp extends StatelessWidget {
  final AppRouter router;

  const MerchantDemoApp({Key? key, required this.router}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
    );
  }
}
