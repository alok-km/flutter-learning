import 'package:flutter/material.dart';
import 'package:payment_demo_app/models/confirm_payment.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.paymentInfo}) : super(key: key);
  final Map paymentInfo;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  getPaymentConfirmation() async {
    if (widget.paymentInfo["Proxy Identifier Type"] == "Email Address") {
      widget.paymentInfo["Proxy Identifier Type"] = "EMAL";
    }
    confirmPayment(
        widget.paymentInfo["Currency"],
        widget.paymentInfo["Amount"],
        widget.paymentInfo["Beneficiary Bank Code"],
        widget.paymentInfo["Proxy Identifier"],
        widget.paymentInfo["Proxy Identifier Type"],
        widget.paymentInfo["Reference Label"]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 500,
          child: ListView.builder(
            itemCount: widget.paymentInfo.length,
            itemBuilder: (BuildContext context, int index) {
              String key = widget.paymentInfo.keys.elementAt(index);
              return Column(
                children: [
                  ListTile(
                    title: Text("$key"),
                    subtitle: Text("${widget.paymentInfo[key]}"),
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
