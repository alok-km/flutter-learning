import 'package:flutter/material.dart';

//ignore: must_be_immutable
class Body extends StatelessWidget {
  Body({Key? key, required this.paymentRecords}) : super(key: key);
  var paymentRecords;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
      child: ListView(
        children: [
          Row(
            children: [
              Icon(
                Icons.payment,
                color: Colors.green,
              ),
              SizedBox(width: 8),
              Text(
                "Payment Records",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Divider(height: 15, thickness: 2),
          SizedBox(height: 10),
          Container(
            height: 500,
            child: ListView.builder(
              itemCount: paymentRecords.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Payment Record ${index + 1}: ",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    ListTile(
                      title: Text("Settlement Amount"),
                      subtitle:
                          Text("${paymentRecords[index]["settlementAmt"]}"),
                    ),
                    ListTile(
                      title: Text("Beneficiary Bank Code"),
                      subtitle:
                          Text("${paymentRecords[index]["clearingCode"]}"),
                    ),
                    ListTile(
                      title: Text("Proxy Identifier"),
                      subtitle:
                          Text("${paymentRecords[index]["creditorAcctId"]}"),
                    ),
                    ListTile(
                      title: Text("Proxy Identifier Type"),
                      subtitle: Text(
                          "${paymentRecords[index]["creditorAcctIdType"]}"),
                    ),
                    Divider(
                      height: 2.0,
                    ),
                  ],
                );
                //String key = paymentRecords[index].keys.elementAt(index);
                // return Column(
                //   children: [
                //     ListTile(
                //       title: Text("$key"),
                //       subtitle: Text("${paymentRecords[index][key]}"),
                //     ),
                //     Divider(
                //       height: 2.0,
                //     ),
                //   ],
                // );
              },
            ),
          ),
        ],
      ),
    );
  }
}
