import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:merchant_demo_app/constants/strings.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Text(
      'Merchant App',
    ),
    backgroundColor: kPrimaryColor,
    elevation: 0,
    leading: IconButton(
      onPressed: () {},
      icon: SvgPicture.asset("lib/assets/icons/menu.svg"),
    ),
  );
}
