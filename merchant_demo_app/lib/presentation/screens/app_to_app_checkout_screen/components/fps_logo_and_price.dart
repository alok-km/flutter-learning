import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant_demo_app/constants/strings.dart';
import 'package:merchant_demo_app/controllers/cart_item_controller.dart';

class FPSLogoAndPrice extends StatelessWidget {
  FPSLogoAndPrice({Key? key}) : super(key: key);
  final CartItemController cartItemController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Image.asset("lib/assets/images/fps.png"),
      ),
      SizedBox(height: 40),
      Text(
        "HKD ${cartItemController.total[0]}",
        style: Theme.of(context)
            .textTheme
            .headline4!
            .copyWith(color: Colors.grey[850], fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 40),
    ]);
  }
}
