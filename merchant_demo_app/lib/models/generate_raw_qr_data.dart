import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/io_client.dart';
import 'package:merchant_demo_app/constants/strings.dart';

Future generateRawQrData(String currency, String price, String refLabel) async {
  Map<String, dynamic> decodedResponse;
  final body = jsonEncode({
    "poiMethod": "DYNAMIC",
    "trxCurrency": "$currency",
    "trxAmt": "$price",
    "referenceLabel": "$refLabel",
    "clearingCode": "004",
    "proxyId": "dev@iaspec.com",
    "proxyIdType": "EMAIL_ADDRESS",
    "merchantTimeout": 1665639120000,
    "editableTrxAmtIndicator": false
  });
  bool trustSelfSigned = true;
  HttpClient httpClient = new HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => trustSelfSigned);
  IOClient ioClient = new IOClient(httpClient);
  final response = await ioClient.post(
    Uri.parse(encodeEmvQRCode),
    body: body,
    headers: {
      "Content-Type": "application/json",
      "x-system-id": "alok",
    },
  );
  decodedResponse = jsonDecode(response.body);
  if (decodedResponse["status"] == "Success") {
    return decodedResponse["data"]["rawQrData"];
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
