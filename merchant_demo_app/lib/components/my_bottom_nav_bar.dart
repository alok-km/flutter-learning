import 'package:flutter/material.dart';
import 'package:merchant_demo_app/constants/strings.dart';

//ignore: must_be_immutable
class MyBottomNavBar extends StatelessWidget {
  MyBottomNavBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
        //bottom: kDefaultPadding,
      ),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: Offset(0, -10),
              blurRadius: 35,
              color: kPrimaryColor.withOpacity(0.38))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, HOME),
            icon: Image.asset("lib/assets/icons/home.png"),
          ),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, CHECKOUT),
            icon: Image.asset("lib/assets/icons/app-to-app-payment.png"),
          ),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, QRPAYMENT),
            icon: Image.asset("lib/assets/icons/qr-code.png"),
          ),

          // Text(
          //   "Total: 060",
          //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          // ),
          // Spacer(),
          // ElevatedButton(
          //   onPressed: () => Navigator.pushNamed(context, CHECKOUT),
          //   child: Text(
          //     "Checkout",
          //     style: Theme.of(context)
          //         .textTheme
          //         .headline5!
          //         .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          //   ),
          //   style: ElevatedButton.styleFrom(
          //     primary: Colors.grey[700],
          //     textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          //   ),
          // ),
        ],
      ),
    );
  }
}
