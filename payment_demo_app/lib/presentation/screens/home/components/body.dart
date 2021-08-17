import 'package:flutter/material.dart';
import 'package:payment_demo_app/models/check_payment_confirmation.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.paymentInfo}) : super(key: key);
  final Map paymentInfo;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  getPaymentConfirmation() {
    checkPaymentConfirmation(
      widget.paymentInfo["Currency"],
      widget.paymentInfo["Amount"],
      widget.paymentInfo["Beneficiary Bank Code"],
      widget.paymentInfo["Proxy Identifier"],
      widget.paymentInfo["Proxy Identifier Type"],
    );
  }

  @override
  Widget build(BuildContext context) {
    // initialize();
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
