import 'package:flutter/material.dart';
import 'package:payment_demo_app/models/check_payment_confirmation.dart';
import 'package:payment_demo_app/models/decode_emv_qr_code.dart';
import 'package:payment_demo_app/models/retrieve_app_to_app_token.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.receivedUrl}) : super(key: key);
  final String receivedUrl;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String decryptedUrl = "";
  var paymentInfo = new Map();

  getPayload() async {
    final response = await retrieveAppToAppToken(widget.receivedUrl);
    setState(() {
      decryptedUrl = response;
    });
    print(decryptedUrl);
  }

  getPaymentInfo() async {
    final response = await decodeEmvQRCode(decryptedUrl);
    setState(() {
      paymentInfo["Currency"] = response["trxCurrency"];
      paymentInfo["Amount"] = response["trxAmt"];
      paymentInfo["Reference Label"] = response["referenceLabel"];
      paymentInfo["Proxy Identifier"] = response["proxyId"];
      paymentInfo["Proxy Identifier Type"] = response["proxyIdType"];
      if (paymentInfo["Proxy Identifier Type"] == "EMAIL_ADDRESS") {
        paymentInfo["Proxy Identifier Type"] = "Email Address";
      }
      paymentInfo["Beneficiary Bank Code"] = response["clearingCode"];
    });
    print(paymentInfo);
  }

  initialize() async {
    await getPayload();
    await getPaymentInfo();
  }

  getPaymentConfirmation() {
    checkPaymentConfirmation(
      paymentInfo["Currency"],
      paymentInfo["Amount"],
      paymentInfo["Beneficiary Bank Code"],
      paymentInfo["Proxy Identifier"],
      paymentInfo["Proxy Identifier Type"],
    );
  }

  @override
  Widget build(BuildContext context) {
    initialize();
    return Column(
      children: [
        Container(
          height: 500,
          child: ListView.builder(
            itemCount: paymentInfo.length,
            itemBuilder: (BuildContext context, int index) {
              String key = paymentInfo.keys.elementAt(index);
              return Column(
                children: [
                  ListTile(
                    title: Text("$key"),
                    subtitle: Text("${paymentInfo[key]}"),
                  ),
                  Divider(
                    height: 2.0,
                  ),
                ],
              );
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            getPaymentConfirmation();
          },
          child: Text("Confirm Payment"),
        ),
      ],
    );
  }
}
