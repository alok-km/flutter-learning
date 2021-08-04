import 'package:flutter/material.dart';
import 'package:merchant_demo_app/constants/strings.dart';
import 'package:merchant_demo_app/controllers/cart_item_controller.dart';
import 'package:get/get.dart';

//ignore: must_be_immutable
class MyBottomNavBarHome extends StatelessWidget {
  MyBottomNavBarHome({Key? key, required this.cartItemController})
      : super(key: key);
  final CartItemController cartItemController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
      ),
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: Offset(0, -10),
              blurRadius: 35,
              color: kPrimaryColor.withOpacity(0.38))
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Obx(
            () => Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset("lib/assets/icons/shopping-cart.png"),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: kDefaultPadding, right: kDefaultPadding),
                  child: Text(
                    "Total: ${cartItemController.total}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Spacer(),
                Container(
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, CHECKOUT),
                    child: Text("Checkout"),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 2,
            indent: 0,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, HOME),
                  icon: Image.asset("lib/assets/icons/home.png"),
                ),
                IconButton(
                  onPressed: () => Navigator.pushNamed(context, QRPAYMENT),
                  icon: Image.asset("lib/assets/icons/qr-code.png"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
