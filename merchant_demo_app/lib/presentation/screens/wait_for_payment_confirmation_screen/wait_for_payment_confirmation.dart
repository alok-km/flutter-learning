import 'package:flutter/material.dart';
import 'package:merchant_demo_app/constants/strings.dart';
import 'package:merchant_demo_app/models/launch_android_intent.dart';
import 'package:merchant_demo_app/models/retrieve_app_to_app_token.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
