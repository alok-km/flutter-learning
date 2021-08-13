import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:merchant_demo_app/constants/strings.dart';
import 'package:get/get.dart';
import 'package:merchant_demo_app/controllers/cart_item_controller.dart';

class CartItemCard extends StatelessWidget {
  CartItemCard({
    Key? key,
    required this.image,
    required this.title,
    required this.brand,
    required this.price,
    required this.press,
    required this.index,
    required this.cartItemController,
  }) : super(key: key);

  final String image, title, brand;
  final int index;
  final double price;
  final VoidCallback press;
  final CartItemController cartItemController;
  @override
  Widget build(BuildContext context) {
    final priceAsString = price.toStringAsFixed(2);
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.435,
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
                        '\$$priceAsString',
                        style: Theme.of(context)
                            .textTheme
                            .button!
                            .copyWith(color: kPrimaryColor),
                      ),
                    ],
                  ),
                  Obx(
                    () => Row(
                      children: [
                        Spacer(),
                        Container(
                          width: 30,
                          child: TextButton(
                            onPressed: () {
                              if (cartItemController.cartItemCount[index] > 0) {
                                cartItemController.total[0] = double.parse(
                                    (cartItemController.total[0] -
                                            cartItemController.prices[index])
                                        .toStringAsFixed(2));
                              }
                              cartItemController.decrement(index);
                            },
                            child: Text(
                              "-",
                              style: Theme.of(context)
                                  .textTheme
                                  .button!
                                  .copyWith(color: kPrimaryColor),
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          '${cartItemController.cartItemCount[index]}',
                          style: Theme.of(context)
                              .textTheme
                              .button!
                              .copyWith(color: kPrimaryColor),
                        ),
                        Spacer(),
                        Container(
                          width: 30,
                          child: TextButton(
                            onPressed: () {
                              cartItemController.total[0] = double.parse(
                                  (cartItemController.total[0] +
                                          cartItemController.prices[index])
                                      .toStringAsFixed(2));
                              cartItemController.increment(index);
                            },
                            child: Text(
                              "+",
                              style: Theme.of(context)
                                  .textTheme
                                  .button!
                                  .copyWith(color: kPrimaryColor),
                            ),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
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
