import 'package:flutter/material.dart';
import 'package:merchant_demo_app/components/build_app_bar.dart';
import 'package:merchant_demo_app/components/my_bottom_nav_bar.dart';
import 'components/body.dart';

//ignore: must_be_immutable
class DisplayQRCode extends StatefulWidget {
  DisplayQRCode({
    Key? key,
    required this.rawQrData,
    required this.amountController,
    required this.dropDownValue,
  }) : super(key: key);
  String dropDownValue;
  String rawQrData;
  TextEditingController amountController;

  @override
  _DisplayQRCodeState createState() => _DisplayQRCodeState();
}

class _DisplayQRCodeState extends State<DisplayQRCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Merchant App"),
      body: Body(
        rawQrData: widget.rawQrData,
        dropDownValue: widget.dropDownValue,
        amountController: widget.amountController,
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
