import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:merchant_demo_app/constants/strings.dart';
import 'package:merchant_demo_app/models/generate_random_ref_label.dart';
import 'package:merchant_demo_app/models/generate_raw_qr_data.dart';
import 'package:merchant_demo_app/presentation/screens/display_qr_screen/display_qr_code_screen.dart';
import 'package:merchant_demo_app/presentation/screens/home/components/header_with_searchbox.dart';

//ignore: must_be_immutable
class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String dropDownValue = 'HKD';
  var items = ["HKD", "USD", "RMB", "EUR"];
  final amountController = TextEditingController();
  String rawQrData = '';
  bool generatedQr = false;
  getRawQrData() async {
    String refLabel = generateRefLabel();
    await generateRawQrData(
      dropDownValue,
      amountController.text,
      refLabel,
    ).then(
      (value) => {
        setState(() {
          rawQrData = value;
          generatedQr = true;
        })
      },
    );
    if (await generatedQr) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DisplayQRCode(
            rawQrData: rawQrData,
            dropDownValue: dropDownValue,
            amountController: amountController,
          ),
          settings: RouteSettings(
            arguments: rawQrData,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          //1. the header on top of the screen
          HeaderWithSearchBox(size: size),
          //2. currency drop down and amount inputter
          Padding(
            padding: const EdgeInsets.only(
                left: kDefaultPadding * 3, right: kDefaultPadding * 2),
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                  children: [
                    Container(
                      child: Text(
                        "Currency: ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    DropdownButton(
                      value: dropDownValue,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                            value: items, child: Text(items));
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropDownValue = newValue!;
                        });
                      },
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Container(
                      child: Text(
                        "Amount: ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: 50,
                      child: TextField(
                        controller: amountController,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+.?\d{0,2}')),
                        ], //to only allow 2 decimal places
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                          signed: false,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          //. generate button
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 100,
              right: 100,
            ),
            child: ConstrainedBox(
              constraints:
                  BoxConstraints.tightFor(width: double.infinity, height: 40),
              child: ElevatedButton(
                onPressed: () async {
                  await getRawQrData();
                  print(rawQrData);
                },
                child: Text(
                  "Generate",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
