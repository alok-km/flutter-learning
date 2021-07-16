import 'package:flutter/material.dart';
import 'package:merchant_demo_app/presentation/screens/checkout_screen/components/price_with_pay_btn.dart';
import 'package:merchant_demo_app/presentation/screens/home/components/header_with_searchbox.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWithSearchBox(size: size),
          PriceWithPayBtn(price: "6996.00"),
        ],
      ),
    );
  }
}
