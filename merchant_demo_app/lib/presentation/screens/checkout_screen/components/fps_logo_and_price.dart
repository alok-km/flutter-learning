import 'package:flutter/material.dart';
import 'package:merchant_demo_app/constants/strings.dart';

class FPSLogoAndPrice extends StatelessWidget {
  const FPSLogoAndPrice({Key? key, required this.price}) : super(key: key);
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Image.asset("lib/assets/images/fps.png"),
      ),
      SizedBox(height: 40),
      Text(
        "HKD ${price}",
        style: Theme.of(context)
            .textTheme
            .headline4!
            .copyWith(color: Colors.grey[850], fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 40),
    ]);
  }
}
