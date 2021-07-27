import 'package:flutter/material.dart';
import 'package:merchant_demo_app/models/build_app_bar.dart';
import 'package:merchant_demo_app/presentation/screens/checkout_screen/components/body.dart';

class DisplayQRCode extends StatelessWidget {
  const DisplayQRCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }
}
