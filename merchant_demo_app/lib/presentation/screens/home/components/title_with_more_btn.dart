import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:merchant_demo_app/constants/strings.dart';

class TitleWithMoreBtn extends StatelessWidget {
  const TitleWithMoreBtn({
    Key? key,
    required this.title,
    required this.press,
    required this.pre_icon,
    required this.post_icon,
  }) : super(key: key);

  final String title, pre_icon, post_icon;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
      ),
      child: Row(
        children: [
          TitleWithCustomUnderline(
            text: title,
            icon: pre_icon,
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            iconSize: 20,
            icon: Image.asset(post_icon),
          )
        ],
      ),
    );
  }
}

class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final String text, icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Stack(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: kDefaultPadding / 4),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: kDefaultPadding / 2),
                    child: Container(
                      height: 30,
                      width: 30,
                      child: SvgPicture.asset(icon),
                    ),
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(right: kDefaultPadding / 4),
              height: 7,
              color: kPrimaryColor.withOpacity(0.2),
            ),
          ),
        ],
      ),
    );
  }
}
