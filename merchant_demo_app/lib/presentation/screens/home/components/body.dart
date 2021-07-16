import 'package:flutter/material.dart';
import 'package:merchant_demo_app/constants/strings.dart';
import 'package:merchant_demo_app/presentation/screens/home/components/items.dart';

import 'header_with_searchbox.dart';
import 'cart_title_with_edit_btn.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWithSearchBox(size: size),
          CartTitleWithEditBtn(
            title: "Shopping Cart",
            pre_icon: "lib/assets/icons/shopping-cart.svg",
            post_icon: "lib/assets/icons/edit_cart.png",
            press: () {},
          ),
          ItemList(),
          SizedBox(
            height: kDefaultPadding,
          ),
        ],
      ),
    );
  }
}
