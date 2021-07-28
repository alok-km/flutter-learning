import 'package:flutter/material.dart';
import 'package:merchant_demo_app/presentation/screens/home/components/cart_item_card.dart';

//ignore: must_be_immutable
class ItemList extends StatelessWidget {
  ItemList({Key? key}) : super(key: key);
  List prices = [1199, 1999, 799, 2999];
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
                  title: "Nike AF1 Mid",
                  brand: "Nike",
                  price: prices[0],
                  press: () {}),
              CartItemCard(
                  image: "lib/assets/images/echo.jpg",
                  title: "Echo Home",
                  brand: "Amazon",
                  price: prices[1],
                  press: () {}),
            ],
          ),
          Row(
            children: [
              CartItemCard(
                  image: "lib/assets/images/perfume.jpg",
                  title: "Parfum",
                  brand: "Jo Malone",
                  price: prices[2],
                  press: () {}),
              CartItemCard(
                  image: "lib/assets/images/headphones.jpg",
                  title: "Studio 3",
                  brand: "Beats by Dre",
                  price: prices[3],
                  press: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
