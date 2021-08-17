import 'package:flutter/material.dart';
import 'package:payment_demo_app/models/decode_emv_qr_code.dart';
import 'package:payment_demo_app/models/retrieve_app_to_app_token.dart';
import 'package:payment_demo_app/presentation/screens/home/home_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.receivedUrl}) : super(key: key);
  final String receivedUrl;
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String decryptedUrl = "";
  var paymentInfo = new Map();
  bool flag1 = false;
  bool flag2 = false;

  getPayload() async {
    print("rec url: ${widget.receivedUrl}");
    final response = await retrieveAppToAppToken(widget.receivedUrl);
    decryptedUrl = response;
    print(decryptedUrl);
    flag1 = true;
  }

  getPaymentInfo() async {
    final response = await decodeEmvQRCode(decryptedUrl);
    paymentInfo["Currency"] = response["trxCurrency"];
    paymentInfo["Amount"] = response["trxAmt"];
    paymentInfo["Reference Label"] = response["referenceLabel"];
    paymentInfo["Proxy Identifier"] = response["proxyId"];
    paymentInfo["Proxy Identifier Type"] = response["proxyIdType"];
    if (paymentInfo["Proxy Identifier Type"] == "EMAIL_ADDRESS") {
      paymentInfo["Proxy Identifier Type"] = "Email Address";
    }
    paymentInfo["Beneficiary Bank Code"] = response["clearingCode"];
    print(paymentInfo);
    flag2 = true;
  }

  initialise() async {
    await getPayload();
    await getPaymentInfo();
    if (flag1 && flag2) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HomeScreen(paymentInfo: paymentInfo),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    initialise();
    return Container();
  }
}
