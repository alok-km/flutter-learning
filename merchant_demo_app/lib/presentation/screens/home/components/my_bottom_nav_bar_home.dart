import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:merchant_demo_app/constants/strings.dart';
import 'package:merchant_demo_app/controllers/cart_item_controller.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';

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
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(
                      left: kDefaultPadding, right: kDefaultPadding),
                  child: Text(
                    "Total: ${cartItemController.total[0].toStringAsFixed(2)}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
                Spacer(),
                Container(
                  width: 80,
                  child: ElevatedButton(
                    onPressed: () {
                      if (cartItemController.cartItemCount.sum > 0) {
                        Navigator.pushNamed(context, CHECKOUT);
                      } else {
                        Fluttertoast.showToast(
                          msg: "There are no items in the shopping cart.",
                          toastLength: Toast.LENGTH_LONG,
                          backgroundColor: Colors.grey[900],
                          textColor: Colors.redAccent[400],
                        );
                      }
                    },
                    child: Text(
                      "Checkout",
                      style: TextStyle(fontSize: 11),
                    ),
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
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        HOME, (Route<dynamic> route) => false);
                  },
                  icon: Image.asset("lib/assets/icons/home.png"),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, QRPAYMENT);
                  },
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
