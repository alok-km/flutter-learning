import 'package:flutter/material.dart';
import 'package:merchant_demo_app/constants/strings.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
        //bottom: kDefaultPadding,
      ),
      height: 80,
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
            onPressed: () => Navigator.pushNamed(context, CHECKOUT),
            icon: Image.asset("lib/assets/icons/checkout.png"),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset("lib/assets/icons/share.png"),
          ),
        ],
      ),
    );
  }
}
