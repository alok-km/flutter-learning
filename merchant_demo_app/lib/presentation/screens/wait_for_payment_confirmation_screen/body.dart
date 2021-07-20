import 'package:flutter/material.dart';
import 'package:merchant_demo_app/constants/strings.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image.asset("lib/assets/icons/waiting_for_payment.png"),
          ),
          SizedBox(height: kDefaultPadding),
          Container(
            child: Text(
              "Waiting for payment to be made...",
              style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: Colors.grey[800], fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
