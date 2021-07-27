import 'package:flutter/material.dart';
import 'package:merchant_demo_app/constants/strings.dart';
import 'items.dart' as items;

//ignore: must_be_immutable
class MyBottomNavBar extends StatelessWidget {
  MyBottomNavBar({
    Key? key,
  }) : super(key: key);
  num price = 0;

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < items.prices.length; i++) {
      price += items.prices[i];
    }
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
            onPressed: () {},
            icon: Image.asset("lib/assets/icons/checkout.png"),
          ),
          Spacer(),
          Text(
            "Total: ${price}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, CHECKOUT),
            child: Text(
              "Checkout",
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.grey[700],
              textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
