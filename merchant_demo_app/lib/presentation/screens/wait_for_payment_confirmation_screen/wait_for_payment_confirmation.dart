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
    getPayload();
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
