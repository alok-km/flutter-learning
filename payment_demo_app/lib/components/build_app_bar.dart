import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar buildAppBar() {
  var kPrimaryColor;
  return AppBar(
    title: Text(
      'Payment App',
    ),
    backgroundColor: kPrimaryColor,
    elevation: 0,
    leading: IconButton(
      onPressed: () {},
      icon: SvgPicture.asset("lib/assets/icons/menu.svg"),
    ),
  );
}
