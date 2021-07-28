import 'package:flutter/material.dart';
import 'package:merchant_demo_app/presentation/screens/home/components/header_with_searchbox.dart';
import 'fps_logo_and_price.dart';
import 'payment_with_fps_button.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWithSearchBox(size: size),
          FPSLogoAndPrice(price: "6996.0"),
          PaymentWithFPSButton(),
        ],
      ),
    );
  }
}
