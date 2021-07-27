import 'package:flutter/material.dart';
import 'package:merchant_demo_app/models/generate_raw_qr_data.dart';
import 'package:merchant_demo_app/presentation/screens/home/components/header_with_searchbox.dart';
import 'amount_inputter.dart';
import 'currency_drop_down.dart';
import 'generate_btn.dart';

//ignore: must_be_immutable
class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String rawQrData = '';
  final key = GlobalKey();
  final amountController = TextEditingController();
  String dropDownValue = "HKD";
  getRawQrData() async {
    final tokenResult =
        await generateRawQrData(dropDownValue, amountController.text);
    setState(() {
      rawQrData = tokenResult;
    });
  }

  //have to call getToken() in initState() because we want it to be
  //executed when the screen is initialized
  @override
  void initState() {
    super.initState();
    getRawQrData();
    // generateRawQrData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWithSearchBox(size: size),
          Column(
            children: [
              CurrencyDropDown(dropDownValue: dropDownValue),
              AmountInputter(amountController: amountController),
            ],
          ),
          GenerateBtn(),
        ],
      ),
    );
  }
}
