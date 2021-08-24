import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/io_client.dart';
import 'package:merchant_demo_app/constants/strings.dart';
import 'package:merchant_demo_app/controllers/welcome_screen_controller.dart';
import 'package:get/get.dart';

Future logout(String userId, String loginToken) async {
  WelcomeScreenX welcomeScreenX = Get.find();
  final body = jsonEncode({
    "userId": userId,
    "loginToken": loginToken,
  });
  bool trustSelfSigned = true;
  HttpClient httpClient = new HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => trustSelfSigned);
  IOClient ioClient = new IOClient(httpClient);
  final response = await ioClient.post(
    Uri.parse(logoutUrl),
    body: body,
    headers: {
      "Content-Type": "application/json",
      "x-system-id": "alok",
    },
  );
  Map<String, dynamic> decodedResponse = jsonDecode(response.body);
  if (decodedResponse["status"] == "Success") {
    welcomeScreenX.loginToken = 'null';
    print(welcomeScreenX.loginToken);
    return decodedResponse;
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
