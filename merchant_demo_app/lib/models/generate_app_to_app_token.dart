import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/io_client.dart';
import 'package:merchant_demo_app/constants/strings.dart';
import 'package:merchant_demo_app/controllers/cart_item_controller.dart';
import 'package:get/get.dart';
import 'package:merchant_demo_app/controllers/configuration_controller.dart';

Future generateAppToAppToken(String refLabel) async {
  final CartItemController cartItemController = Get.find();
  final ConfigurationController configurationController = Get.find();

  final body = jsonEncode({
    "proxyId": "${configurationController.properties[0]}",
    "proxyIdType": "${configurationController.properties[1]}",
    "merchantTimeout": 1665639120000,
    "transactionCcy": "HKD",
    "transactionAmount": "${cartItemController.total[0]}",
    "referenceLabel": "${refLabel}"
  });
  bool trustSelfSigned = true;
  HttpClient httpClient = new HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => trustSelfSigned);
  IOClient ioClient = new IOClient(httpClient);
  final response = await ioClient.post(
    Uri.parse(generateTokenURL),
    body: body,
    headers: {
      "Content-Type": "application/json",
      "x-system-id": "alok",
    },
  );
  Map<String, dynamic> decodedResponse = jsonDecode(response.body);
  if (decodedResponse["status"] == "Success") {
    return decodedResponse['token'];
  } else {
    Fluttertoast.showToast(
      msg:
          "There was a problem while calling the API. Status: ${decodedResponse["status"]}, error: ${decodedResponse["error"]}.",
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: Colors.grey[900],
      textColor: Colors.redAccent[400],
    );
  }
}
