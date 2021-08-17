import 'package:flutter/material.dart';
import 'package:payment_demo_app/components/build_app_bar.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.paymentInfo}) : super(key: key);
  final Map paymentInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(paymentInfo: paymentInfo),
    );
  }
}
