import 'package:flutter/material.dart';
import 'package:merchant_demo_app/models/build_app_bar.dart';
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
      appBar: buildAppBar(),
      body: Body(),
    );
  }
}
