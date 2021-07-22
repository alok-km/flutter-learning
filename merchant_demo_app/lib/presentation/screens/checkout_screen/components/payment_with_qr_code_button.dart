import 'package:flutter/material.dart';
import 'package:merchant_demo_app/constants/strings.dart';
import 'package:merchant_demo_app/presentation/screens/qr_payment_screen/qr_payment_screen.dart';

//ignore: must_be_immutable
class PaymentWithQRButton extends StatefulWidget {
  const PaymentWithQRButton({Key? key}) : super(key: key);

  @override
  _PaymentWithQRButtonState createState() => _PaymentWithQRButtonState();
}

class _PaymentWithQRButtonState extends State<PaymentWithQRButton> {
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
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => QRPaymentScreen(),
                ));
              },
              child: Text(
                "QR Code Payment",
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
