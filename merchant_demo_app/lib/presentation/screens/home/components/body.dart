import 'package:flutter/material.dart';
import 'package:merchant_demo_app/constants/strings.dart';
import 'package:merchant_demo_app/controllers/cart_item_controller.dart';
import 'package:merchant_demo_app/presentation/screens/home/components/items.dart';
import '../../../../components/header_with_searchbox.dart';
import 'cart_title_with_edit_btn.dart';

class Body extends StatelessWidget {
  Body({Key? key, required this.cartItemController}) : super(key: key);
  final CartItemController cartItemController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWithSearchBox(size: size),
          CartTitleWithEditBtn(
            title: "Shopping Cart",
            preIcon: "lib/assets/icons/shopping-cart.svg",
            postIcon: "lib/assets/icons/edit_cart.png",
            press: () {},
          ),
          ItemList(cartItemController: cartItemController),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
