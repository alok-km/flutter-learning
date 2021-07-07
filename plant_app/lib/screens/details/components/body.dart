import 'package:flutter/material.dart';
import 'package:plant_app/screens/details/components/title_and_price.dart';
import '../../../constants.dart';
import 'buy_and_desc_button.dart';
import 'image_and_icons.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          ImageAndIcons(size: size),
          TitleAndPrice(
            title: "Angelica",
            country: "Russia",
            price: 440,
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          BuyAndDescButton(),
        ],
      ),
    );
  }
}
