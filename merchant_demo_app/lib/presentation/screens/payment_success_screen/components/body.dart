import 'package:flutter/material.dart';
import 'package:merchant_demo_app/constants/strings.dart';
import 'package:merchant_demo_app/presentation/screens/home/components/header_with_searchbox.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        HeaderWithSearchBox(size: size),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: kDefaultPadding),
            Container(
              child: Image.asset("lib/assets/icons/payment_done.png"),
            ),
            SizedBox(height: kDefaultPadding),
            Container(
              child: Text(
                "Payment Successful!",
                style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Colors.grey[800], fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
