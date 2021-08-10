import 'package:flutter/material.dart';
import 'package:payment_demo_app/models/decode_emv_qr_code.dart';
import 'package:payment_demo_app/presentation/screens/display_payment_info_screen/display_payment_info_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.decryptedUrl}) : super(key: key);
  final String decryptedUrl;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var paymentInfo = new Map();
  getPaymentInfo() async {
    final response = await decodeEmvQRCode(widget.decryptedUrl);
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

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text(widget.decryptedUrl),
        ElevatedButton(
          onPressed: () async {
            await getPaymentInfo();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    DisplayPaymentInfoScreen(paymentInfo: paymentInfo),
              ),
            );
          },
          child: Text("Decode Emv QR Code"),
        ),
      ],
    ));
  }
}
