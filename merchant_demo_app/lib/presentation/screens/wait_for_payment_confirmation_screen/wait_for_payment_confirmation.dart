import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant_demo_app/constants/strings.dart';
import 'package:merchant_demo_app/controllers/reference_label_controller.dart';
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

  ReferenceLabelX referenceLabelX = Get.find();
  Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      var messageJson = jsonDecode(initialMessage.data["data"]);
      if (messageJson["endToEndId"] == referenceLabelX.referenceLabel) {
        Navigator.of(context).pushNamed(PAYMENTSUCCESS);
      }
    }

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      var messageJson = jsonDecode(message.data["data"]);
      print("Message json: ${messageJson["endToEndId"]}");
      if (messageJson["endToEndId"] == referenceLabelX.referenceLabel) {
        Navigator.of(context).pushNamed(PAYMENTSUCCESS);
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
