import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:merchant_demo_app/constants/strings.dart';
import 'package:merchant_demo_app/models/launch_android_intent.dart';
import 'package:merchant_demo_app/models/retrieve_app_to_app_token.dart';
import 'package:merchant_demo_app/presentation/screens/wait_for_payment_confirmation_screen/body.dart';
import 'package:merchant_demo_app/services/local_notification_service.dart';

//ignore: must_be_immutable
class WaitForPaymentConfirmation extends StatefulWidget {
  WaitForPaymentConfirmation({Key? key, required this.token}) : super(key: key);
  String token;

  @override
  _WaitForPaymentConfirmationState createState() =>
      _WaitForPaymentConfirmationState(token);
}

class _WaitForPaymentConfirmationState
    extends State<WaitForPaymentConfirmation> {
  String token;
  String payload = "";
  _WaitForPaymentConfirmationState(this.token);

  getPayload() async {
    final payloadResult =
        await retrieveAppToAppToken(retrieveTokenURLprefix + token);
    setState(() {
      payload = payloadResult;
    });
    //we need to launch the intent to open payment app after
    //we successfully get the paylaad
    launchAndroidIntent(payload);
  }

  @override
  void initState() {
    super.initState();
    getPayload();

    LocalNotificationService.initialize(context);

    //gives us the message on which user taps and it opens the app from terminated state
    //basically means it opens the app when the app is closed
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final routeFromMessage = message.data["route"];
        Navigator.of(context).pushReplacementNamed(routeFromMessage);
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
      Navigator.of(context).pushReplacementNamed(routeFromMessage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
