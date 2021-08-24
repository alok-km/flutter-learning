import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:merchant_demo_app/constants/strings.dart';
import 'package:merchant_demo_app/controllers/welcome_screen_controller.dart';
import 'package:merchant_demo_app/models/logout.dart';
import 'package:merchant_demo_app/presentation/screens/welcome_screen/welcome_screen.dart';

AppBar buildAppBar(String title) {
  WelcomeScreenX welcomeScreenX = Get.find();
  return AppBar(
    title: Text(title),
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
    actions: [
      Builder(
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () async {
                var response = await logout(
                  welcomeScreenX.usernameX.text,
                  welcomeScreenX.userpwdX.text,
                );
                if (response["status"] == "Success") {
                  Fluttertoast.showToast(
                    msg: "Successfully logged out",
                    toastLength: Toast.LENGTH_SHORT,
                  );
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => WelcomeScreen()),
                      (Route<dynamic> route) => false);
                }
              },
              child: Row(
                children: [
                  Text(
                    "Logout ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                  Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ],
  );
}
