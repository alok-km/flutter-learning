import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:merchant_demo_app/controllers/welcome_screen_controller.dart';
import 'package:merchant_demo_app/services/local_notification_service.dart';
import 'controllers/cart_item_controller.dart';
import 'models/background_notifications_handler.dart';
import 'presentation/router.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  Get.put(CartItemController());
  Get.put(WelcomeScreenX());
  runApp(MerchantDemoApp(router: AppRouter()));
}

class MerchantDemoApp extends StatefulWidget {
  final AppRouter router;

  const MerchantDemoApp({Key? key, required this.router}) : super(key: key);

  @override
  _MerchantDemoAppState createState() => _MerchantDemoAppState();
}

class _MerchantDemoAppState extends State<MerchantDemoApp> {
  WelcomeScreenX welcomeScreenX = Get.put(WelcomeScreenX());

  Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null &&
        initialMessage.data["referenceLabel"] == "moguts") {
      Navigator.of(context).pushNamed(initialMessage.data["route"]);
    }

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.data["referenceLabel"] == "moguts") {
        Navigator.of(context).pushNamed(message.data["route"]);
      }
    });
  }

  @override
  void initState() {
    super.initState();

    LocalNotificationService.initialize(context);

    //foreground
    FirebaseMessaging.onMessage.listen((message) {
      final routeFromMessage = message.data["route"];
      final referenceLabel = message.data["referenceLabel"];
      if (referenceLabel == "moguts") {
        Navigator.of(context).pushNamed(routeFromMessage);
      }
      LocalNotificationService.display(message);
    });

    setupInteractedMessage();

    //to get the firebase token
    FirebaseMessaging.instance.getToken().then((token) {
      print("Firebase Device Token: $token");
      welcomeScreenX.deviceToken = token!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: widget.router.generateRoute,
    );
  }
}
