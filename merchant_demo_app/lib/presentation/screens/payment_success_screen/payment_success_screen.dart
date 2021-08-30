import 'package:flutter/material.dart';
import 'package:merchant_demo_app/components/my_bottom_nav_bar.dart';
import 'components/body.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
