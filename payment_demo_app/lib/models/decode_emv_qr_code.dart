import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/io_client.dart';
import 'package:payment_demo_app/constants/strings.dart';

Future decodeEmvQRCode(String rawQrData) async {
  final body = jsonEncode({
    "rawQrData": "${rawQrData}",
  });
  bool trustSelfSigned = true;
  HttpClient httpClient = new HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => trustSelfSigned);
  IOClient ioClient = new IOClient(httpClient);
  final response = await ioClient.post(
    Uri.parse(decodeEmvQRCodeUrl),
    body: body,
    headers: {
      "Content-Type": "application/json",
      "x-system-id": "alok",
    },
  );
  Map<String, dynamic> decodedResponse = jsonDecode(response.body);
  if (decodedResponse["status"] == "Success") {
    print("decode qr code ${decodedResponse["data"]}");
    return decodedResponse["data"];
  } else {
    Fluttertoast.showToast(
      msg:
          "There was a problem while calling the API [2]. Status: ${decodedResponse["status"]}, error: ${decodedResponse["error"]}.",
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: Colors.grey[900],
      textColor: Colors.redAccent[400],
    );
  }
}
