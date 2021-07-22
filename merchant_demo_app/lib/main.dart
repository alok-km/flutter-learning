import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:merchant_demo_app/services/local_notification_service.dart';
import 'models/background_notifications_handler.dart';
import 'presentation/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  runApp(MerchantDemoApp(router: AppRouter()));
}

class MerchantDemoApp extends StatefulWidget {
  final AppRouter router;

  const MerchantDemoApp({Key? key, required this.router}) : super(key: key);

  @override
  _MerchantDemoAppState createState() => _MerchantDemoAppState();
}

class _MerchantDemoAppState extends State<MerchantDemoApp> {
  @override
  void initState() {
    super.initState();

    LocalNotificationService.initialize(context);

    //gives us the message on which user taps and it opens the app from terminated state
    //basically means it opens the app when the app is closed
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final routeFromMessage = message.data["route"];
        final referenceLabel = message.data["referenceLabel"];
        if (referenceLabel == "moguts") {
          Navigator.of(context).pushNamed(routeFromMessage);
        }
      }
    });

    //only works when the app is in foreground
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        print(message.notification!.body);
        print(message.notification!.title);
      }

      LocalNotificationService.display(message);
    });

    //only works when the app is in background but open and user taps on the notification
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage = message.data["route"];
      final referenceLabel = message.data["referenceLabel"];
      if (referenceLabel == "moguts") {
        Navigator.of(context).pushNamed(routeFromMessage);
      }
    });

    //to get the firebase token
    // FirebaseMessaging.instance.getToken().then((token) {
    //   print(token); // Print the Token in Console
    // });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: widget.router.generateRoute,
      // routes: {
      //   "paymentSuccess": (_) => PaymentSuccessScreen(),
      // },
    );
  }
}
