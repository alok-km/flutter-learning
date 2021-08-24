import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/io_client.dart';
import 'package:merchant_demo_app/constants/strings.dart';

Future deviceRegistration(
    String ecGatewayDeviceId,
    String customerId,
    String merchantId,
    String userId,
    String password,
    String endToEndIdRegex) async {
  final body = jsonEncode({
    "ecGatewayDeviceId": ecGatewayDeviceId,
    "customerId": customerId,
    "merchantId": merchantId,
    "userId": userId,
    "password": password,
    "endToEndIdRegex": endToEndIdRegex
  });
  bool trustSelfSigned = true;
  HttpClient httpClient = new HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => trustSelfSigned);
  IOClient ioClient = new IOClient(httpClient);
  final response = await ioClient.post(
    Uri.parse(deviceRegistrationUrl),
    body: body,
    headers: {
      "Content-Type": "application/json",
      "x-system-id": "alok",
    },
  );
  Map<String, dynamic> decodedResponse = jsonDecode(response.body);
  if (decodedResponse["status"] == "Success") {
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
