import 'package:flutter/material.dart';
import 'presentation/router.dart';

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }

void main() {
  //HttpOverrides.global = new MyHttpOverrides();
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
