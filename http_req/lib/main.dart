import 'package:flutter/material.dart';
import 'package:http_req/presentation/router.dart';

void main() {
  runApp(
    ApiCatalogueApp(
      router: AppRouter(),
    ),
  );
}

class ApiCatalogueApp extends StatelessWidget {
  final AppRouter router;

  const ApiCatalogueApp({Key? key, required this.router}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
    );
  }
}
