import 'package:flutter/material.dart';
import 'package:merchant_demo_app/constants/strings.dart';
import 'package:merchant_demo_app/models/generate_app_to_app_token.dart';
import 'package:merchant_demo_app/models/retrieve_app_to_app_url.dart';

class PriceWithPayBtn extends StatefulWidget {
  const PriceWithPayBtn({
    Key? key,
    required this.price,
  }) : super(key: key);

  final String price;

  @override
  _PriceWithPayBtnState createState() => _PriceWithPayBtnState();
}

class _PriceWithPayBtnState extends State<PriceWithPayBtn> {
  String token = "";

  getToken() async {
    final result = await generateAppToAppToken();
    setState(() {
      token = result;
    });
  }

  @override
  void initState() {
    super.initState();
    getToken();
  }

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
          "HKD ${widget.price}",
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
              onPressed: () {
                getToken();
                retrieveAppToAppToken(retrieveTokenURLprefix + token);
              },

              //launchAndroidIntent();
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
