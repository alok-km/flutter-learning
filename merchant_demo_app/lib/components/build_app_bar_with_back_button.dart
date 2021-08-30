import 'package:flutter/material.dart';
import 'package:merchant_demo_app/constants/strings.dart';

AppBar buildAppBarWithBackButton(String title) {
  return AppBar(
    title: Text(title),
    backgroundColor: kPrimaryColor,
    elevation: 0,
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios));
      },
    ),
  );
}
