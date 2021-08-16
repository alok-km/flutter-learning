import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant_demo_app/components/build_configure_screen_arrow_row.dart';
import 'package:merchant_demo_app/controllers/configuration_controller.dart';

//ignore: must_be_immutable
class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);
  ConfigurationController configurationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
      child: ListView(
        children: [
          Text(
            "Configure",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Icon(
                Icons.person,
                color: Colors.green,
              ),
              SizedBox(width: 8),
              Text(
                "App to App Payment",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Divider(height: 15, thickness: 2),
          SizedBox(height: 10),
          buildConfigureScreenArrowRow(context, "Proxy ID", "proxyId"),
          buildConfigureScreenArrowRow(context, "Proxy ID Type", "proxyIdType"),
          buildConfigureScreenArrowRow(
              context, "End to End ID Prefix", "endToEndPrefix"),
          // buildConfigureScreenRow(context, "Change Password"),
          // buildConfigureScreenRow(context, "Content Settings"),
          // buildConfigureScreenRow(context, "Social"),
          // buildConfigureScreenRow(context, "Language"),
          // buildConfigureScreenRow(context, "Privacy and Security"),
          // SizedBox(
          //   height: 40,
          // ),
          // Row(
          //   children: [
          //     Icon(
          //       Icons.volume_up_outlined,
          //       color: Colors.green,
          //     ),
          //     SizedBox(
          //       width: 8,
          //     ),
          //     Text(
          //       "Notifications",
          //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //     ),
          //   ],
          // ),
          // Divider(
          //   height: 15,
          //   thickness: 2,
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          // buildNotificationOptionRow("New for you", true),
          // buildNotificationOptionRow("Account activity", true),
          // buildNotificationOptionRow("Opportunity", false),
          // SizedBox(
          //   height: 50,
          // ),
          // Center(
          //   child: OutlinedButton(
          //     child: Text(
          //       "SIGN OUT",
          //       style: TextStyle(
          //         fontSize: 16,
          //         letterSpacing: 2.2,
          //         color: Colors.black,
          //       ),
          //     ),
          //     onPressed: () {},
          //     style: OutlinedButton.styleFrom(
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(20),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
