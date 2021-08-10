import 'package:flutter/material.dart';

//ignore: must_be_immutable
class Body extends StatelessWidget {
  Body({Key? key, required this.paymentInfo}) : super(key: key);
  var paymentInfo;

  @override
  Widget build(BuildContext context) {
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
          onPressed: () {},
          child: Text("Decode Emv QR Code"),
        ),
      ],
    );
  }
}
