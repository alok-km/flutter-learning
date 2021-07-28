import 'package:flutter/material.dart';
import 'package:merchant_demo_app/components/build_app_bar.dart';
import 'package:merchant_demo_app/presentation/screens/checkout_screen/components/body.dart';
import 'package:merchant_demo_app/components/my_bottom_nav_bar.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
