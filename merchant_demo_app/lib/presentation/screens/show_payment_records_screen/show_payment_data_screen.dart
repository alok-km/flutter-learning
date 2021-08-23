import 'package:flutter/material.dart';
import 'package:merchant_demo_app/components/my_bottom_nav_bar.dart';
import 'components/body.dart';

//ignore: must_be_immutable
class ShowPaymentRecordsScreen extends StatefulWidget {
  ShowPaymentRecordsScreen({Key? key, required this.paymentRecords})
      : super(key: key);
  var paymentRecords;
  @override
  _ShowPaymentRecordsScreenState createState() =>
      _ShowPaymentRecordsScreenState();
}

class _ShowPaymentRecordsScreenState extends State<ShowPaymentRecordsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
        ),
      ),
      body: Body(paymentRecords: widget.paymentRecords),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
