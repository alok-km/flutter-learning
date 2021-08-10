import 'package:flutter/material.dart';
import 'package:payment_demo_app/components/build_app_bar.dart';
import 'components/body.dart';

//ignore: must_be_immutable
class DisplayPaymentInfoScreen extends StatelessWidget {
  DisplayPaymentInfoScreen({Key? key, required this.paymentInfo})
      : super(key: key);
  var paymentInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(paymentInfo: paymentInfo),
    );
  }
}
