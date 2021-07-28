import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:merchant_demo_app/constants/strings.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
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
              child: Column(
                children: [
                  Row(
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
                  Row(
                    children: [
                      Spacer(),
                      Text(
                        '-',
                        style: Theme.of(context)
                            .textTheme
                            .button!
                            .copyWith(color: kPrimaryColor),
                      ),
                      Spacer(),
                      Text(
                        '+',
                        style: Theme.of(context)
                            .textTheme
                            .button!
                            .copyWith(color: kPrimaryColor),
                      ),
                      Spacer(),
                    ],
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