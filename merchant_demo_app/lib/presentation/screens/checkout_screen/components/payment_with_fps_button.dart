import 'package:flutter/material.dart';
import 'package:merchant_demo_app/constants/strings.dart';
import 'package:merchant_demo_app/models/generate_app_to_app_token.dart';
import 'package:merchant_demo_app/presentation/screens/wait_for_payment_confirmation_screen/wait_for_payment_confirmation.dart';

//ignore: must_be_immutable
class PaymentWithFPSButton extends StatefulWidget {
  const PaymentWithFPSButton({Key? key}) : super(key: key);

  @override
  _PaymentWithFPSButtonState createState() => _PaymentWithFPSButtonState();
}

class _PaymentWithFPSButtonState extends State<PaymentWithFPSButton> {
  //VARIABLES
  String token = "";

  //FUNCTIONS
  void pressPaymentWithFPSButton() {
    getToken();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => WaitForPaymentConfirmation(token: token),
    ));
  }

  //for converting the future returned from generateAppToAppToken() to string
  getToken() async {
    final tokenResult = await generateAppToAppToken();
    setState(() {
      token = tokenResult;
    });
  }

  //have to call getToken() in initState() because we want it to be
  //executed when the screen is initialized
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
          padding: const EdgeInsets.only(
            left: kDefaultPadding,
            right: kDefaultPadding,
          ),
          child: ConstrainedBox(
            constraints:
                BoxConstraints.tightFor(width: double.infinity, height: 50),
            child: ElevatedButton(
              onPressed: pressPaymentWithFPSButton,
              child: Text(
                "FPS Payment",
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
