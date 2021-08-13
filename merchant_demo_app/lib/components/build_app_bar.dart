import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:merchant_demo_app/constants/strings.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Text(
      'Merchant App',
    ),
    backgroundColor: kPrimaryColor,
    elevation: 0,
    leading: Builder(
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Container(
            child: SvgPicture.asset("lib/assets/icons/menu.svg"),
            padding: EdgeInsets.all(7.0),
          ),
        );
      },
    ),
  );
}
