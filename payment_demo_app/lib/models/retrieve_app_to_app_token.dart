import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/io_client.dart';

Future retrieveAppToAppToken(String retrieveURL) async {
  bool trustSelfSigned = true;
  HttpClient httpClient = new HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => trustSelfSigned);
  IOClient ioClient = new IOClient(httpClient);
  final response = await ioClient.get(
    Uri.parse(retrieveURL),
  );
  Map<String, dynamic> decodedResponse = jsonDecode(response.body);
  if (decodedResponse["status"] == "Success") {
    return decodedResponse["payload"];
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
