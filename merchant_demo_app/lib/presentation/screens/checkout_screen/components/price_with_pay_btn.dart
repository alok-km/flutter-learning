import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:merchant_demo_app/constants/strings.dart';

class PriceWithPayBtn extends StatelessWidget {
  const PriceWithPayBtn({
    Key? key,
    required this.price,
  }) : super(key: key);

  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Image.asset("lib/assets/images/fps.png"),
        ),
        SizedBox(height: 40),
        Text(
          "HKD $price",
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: Colors.grey[850], fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.only(
            left: kDefaultPadding,
            right: kDefaultPadding,
          ),
          child: ConstrainedBox(
            constraints:
                BoxConstraints.tightFor(width: double.infinity, height: 50),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Pay",
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
