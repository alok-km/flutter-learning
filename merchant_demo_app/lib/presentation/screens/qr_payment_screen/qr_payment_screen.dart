import 'package:flutter/material.dart';
import 'package:merchant_demo_app/components/build_app_bar.dart';
import 'package:merchant_demo_app/components/my_bottom_nav_bar.dart';
import 'components/body.dart';

class QRPaymentScreen extends StatefulWidget {
  const QRPaymentScreen({Key? key}) : super(key: key);

  @override
  _QRPaymentScreenState createState() => _QRPaymentScreenState();
}

class _QRPaymentScreenState extends State<QRPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Merchant App"),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
