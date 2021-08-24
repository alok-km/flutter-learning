import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant_demo_app/controllers/configuration_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

GestureDetector buildConfigureScreenArrowRow(
    BuildContext context, String title, String property) {
  TextEditingController propertyController = TextEditingController();
  ConfigurationController configurationController = Get.find();
  var propertyIndex = null;
  if (property == "proxyId") {
    propertyIndex = 0;
  } else if (property == "proxyIdType") {
    propertyIndex = 1;
  } else {
    propertyIndex = 2;
  }
  return GestureDetector(
    onTap: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Set ${title} below: "),
                Container(
                  width: 180,
                  child: TextFormField(
                    controller: propertyController,
                  ),
                ),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () async {
                      configurationController.properties[propertyIndex] =
                          propertyController.text;
                      print(configurationController.properties[propertyIndex]);
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString(
                        "AppToApp_Request_Properties",
                        json.encode(configurationController.properties),
                      );
                      Navigator.of(context).pop();
                    },
                    child: Text("Save"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Close"),
                  ),
                ],
              )
            ],
          );
        },
      );
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600],
                ),
              ),
              Icon(Icons.edit, color: Colors.grey),
            ],
          ),
          Row(
            children: [
              Obx(
                () => Text(
                  "Current: ${configurationController.properties[propertyIndex]}",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
