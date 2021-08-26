import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant_demo_app/constants/strings.dart';
import 'package:merchant_demo_app/controllers/reference_label_controller.dart';
import 'package:merchant_demo_app/models/generate_app_to_app_token.dart';
import 'package:merchant_demo_app/models/generate_random_ref_label.dart';
import 'package:merchant_demo_app/presentation/screens/wait_for_payment_confirmation_screen/wait_for_payment_confirmation.dart';

//ignore: must_be_immutable
class AppToAppPaymentBtn extends StatefulWidget {
  const AppToAppPaymentBtn({Key? key}) : super(key: key);

  @override
  _AppToAppPaymentBtnState createState() => _AppToAppPaymentBtnState();
}

class _AppToAppPaymentBtnState extends State<AppToAppPaymentBtn> {
  //VARIABLES
  String token = "";
  bool flag = false;
  ReferenceLabelX referenceLabelX = Get.put(ReferenceLabelX());

  //FUNCTIONS
  void pressAppToAppPaymentBtn() async {
    await getToken();
    if (flag) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => WaitForPaymentConfirmation(token: token),
        ),
      );
    }
  }

  getToken() async {
    try {
      referenceLabelX.referenceLabel = generateRefLabel();
      final tokenResult =
          await generateAppToAppToken(referenceLabelX.referenceLabel);
      print(tokenResult);
      setState(() {
        token = tokenResult;
      });
      flag = true;
    } catch (err) {
      print(err);
    }
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
              onPressed: pressAppToAppPaymentBtn,
              child: Text(
                "App-to-App Payment",
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
