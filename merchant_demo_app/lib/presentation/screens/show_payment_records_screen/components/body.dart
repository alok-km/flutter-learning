import 'package:flutter/material.dart';
import 'package:merchant_demo_app/models/list_payment_records.dart';

//ignore: must_be_immutable
class Body extends StatefulWidget {
  Body({Key? key, required this.paymentRecords}) : super(key: key);
  var paymentRecords;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String dropDownValue = 'Today';

  var items = ["Today" /*, "3 days", "1 week"*/];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  ),
                ],
              ),
              DropdownButton(
                value: dropDownValue,
                icon: Icon(Icons.keyboard_arrow_down),
                items: items.map((String items) {
                  return DropdownMenuItem(value: items, child: Text(items));
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropDownValue = newValue!;
                    getPaymentRecords(widget.paymentRecords, dropDownValue);
                  });
                },
              ),
            ],
          ),
          Divider(height: 15, thickness: 2),
          SizedBox(height: 10),
          Container(
            height: 500,
            child: ListView.builder(
              itemCount: widget.paymentRecords.length,
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
                      subtitle: Text(
                          "${widget.paymentRecords[index]["settlementAmt"]}"),
                    ),
                    ListTile(
                      title: Text("Beneficiary Bank Code"),
                      subtitle: Text(
                          "${widget.paymentRecords[index]["clearingCode"]}"),
                    ),
                    ListTile(
                      title: Text("Proxy Identifier"),
                      subtitle: Text(
                          "${widget.paymentRecords[index]["creditorAcctId"]}"),
                    ),
                    ListTile(
                      title: Text("Proxy Identifier Type"),
                      subtitle: Text(
                          "${widget.paymentRecords[index]["creditorAcctIdType"]}"),
                    ),
                    Divider(
                      height: 2.0,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
