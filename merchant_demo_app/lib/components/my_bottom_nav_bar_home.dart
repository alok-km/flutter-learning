import 'package:flutter/material.dart';
import 'package:merchant_demo_app/constants/strings.dart';
import 'package:merchant_demo_app/controllers/cart_item_controller.dart';
import 'package:get/get.dart';

//ignore: must_be_immutable
class MyBottomNavBarHome extends StatelessWidget {
  MyBottomNavBarHome({Key? key}) : super(key: key);

  final CartItemController cartItemController = Get.find();

  @override
  Widget build(BuildContext context) {
    cartItemController.resetTotal();
    for (var i = 0; i < cartItemController.cartItemCount.length; i++) {
      cartItemController.total +=
          cartItemController.prices[i] * cartItemController.cartItemCount[i];
    }
    return Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
        //bottom: kDefaultPadding,
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
                Text(
                  "Total: ${cartItemController.total}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Spacer(),
              ],
            ),
          ),
          Divider(
            thickness: 2,
            indent: 0,
          ),
          Row(
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
            ],
          ),
        ],
      ),
    );
  }
}
