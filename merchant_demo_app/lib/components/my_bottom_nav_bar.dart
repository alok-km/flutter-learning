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
            onPressed: () => Navigator.pushReplacementNamed(context, HOME),
            icon: Image.asset("lib/assets/icons/home.png"),
          ),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, QRPAYMENT),
            icon: Image.asset("lib/assets/icons/qr-code.png"),
          ),
        ],
      ),
    );
  }
}
