import 'package:flutter/material.dart';
import 'package:merchant_demo_app/constants/strings.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Row(
            children: [
              Item(
                  image: "lib/assets/images/nike.jpg",
                  title: "Nike Flyknit IV",
                  brand: "Nike",
                  price: 1199,
                  press: () {}),
              Item(
                  image: "lib/assets/images/echo.jpg",
                  title: "Amazon Echo",
                  brand: "Amazon",
                  price: 1999,
                  press: () {}),
            ],
          ),
          Row(
            children: [
              Item(
                  image: "lib/assets/images/perfume.jpg",
                  title: "Parfum",
                  brand: "Jo Malone",
                  price: 799,
                  press: () {}),
              Item(
                  image: "lib/assets/images/headphones.jpg",
                  title: "Studio 3",
                  brand: "Beats by Dre",
                  price: 2999,
                  press: () {}),
            ],
          ),
        ],
      ),
    );
  }
}

class Item extends StatelessWidget {
  const Item({
    Key? key,
    required this.image,
    required this.title,
    required this.brand,
    required this.price,
    required this.press,
  }) : super(key: key);

  final String image, title, brand;
  final int price;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: [
          Image.asset(image),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$title\n".toUpperCase(),
                          style: Theme.of(context).textTheme.button,
                        ),
                        TextSpan(
                          text: "$brand".toUpperCase(),
                          style: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    '\$$price',
                    style: Theme.of(context)
                        .textTheme
                        .button!
                        .copyWith(color: kPrimaryColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
