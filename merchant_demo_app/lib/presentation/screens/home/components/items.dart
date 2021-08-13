import 'package:flutter/material.dart';
import 'package:merchant_demo_app/controllers/cart_item_controller.dart';
import 'cart_item_card.dart';

//ignore: must_be_immutable
class ItemList extends StatelessWidget {
  ItemList({Key? key, required this.cartItemController}) : super(key: key);
  // final CartItemController cartItemController = Get.put(CartItemController());
  final CartItemController cartItemController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Row(
            children: [
              CartItemCard(
                image: "lib/assets/images/nike.jpg",
                title: "Nike AF1",
                brand: "Nike",
                price: cartItemController.prices[0],
                press: () {},
                cartItemController: cartItemController,
                index: 0,
              ),
              CartItemCard(
                image: "lib/assets/images/echo.jpg",
                title: "Echo",
                brand: "Amazon",
                price: cartItemController.prices[1],
                press: () {},
                cartItemController: cartItemController,
                index: 1,
              ),
            ],
          ),
          Row(
            children: [
              CartItemCard(
                image: "lib/assets/images/perfume.jpg",
                title: "Parfum",
                brand: "JoMalone",
                price: cartItemController.prices[2],
                press: () {},
                cartItemController: cartItemController,
                index: 2,
              ),
              CartItemCard(
                image: "lib/assets/images/headphones.jpg",
                title: "Studio 3",
                brand: "Beats",
                price: cartItemController.prices[3],
                press: () {},
                cartItemController: cartItemController,
                index: 3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
