import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:merchant_demo_app/constants/strings.dart';
import 'package:merchant_demo_app/models/launch_android_intent.dart';
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
  _WaitForPaymentConfirmationState(this.token);

  Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null &&
        initialMessage.data["referenceLabel"] == "moguts") {
      //print(initialMessage.data);

      Navigator.of(context).pushNamed(initialMessage.data["route"]);
    }

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      //print(message.data);
      if (message.data["referenceLabel"] == "moguts") {
        Navigator.of(context).pushNamed(message.data["route"]);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    launchAndroidIntent(retrieveTokenURLprefix + token);

    LocalNotificationService.initialize(context);

    //foreground
    FirebaseMessaging.onMessage.listen((message) {
      //print(message.data);
      if (message.data["referenceLabel"] == "moguts") {
        Navigator.of(context).pushNamed(message.data["route"]);
      }
      LocalNotificationService.display(message);
    });

    setupInteractedMessage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
