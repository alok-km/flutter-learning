import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/io_client.dart';
import 'package:merchant_demo_app/constants/strings.dart';

Future listPaymentRecords() async {
  var decodedResponse;
  final body = jsonEncode(
    {
      "reportSize": 1000,
      "offset": 0,
    },
  );
  bool trustSelfSigned = true;
  HttpClient httpClient = new HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => trustSelfSigned);
  IOClient ioClient = new IOClient(httpClient);
  final response = await ioClient.post(
    Uri.parse(listPaymentRecordsUrl),
    body: body,
    headers: {
      "Content-Type": "application/json",
      "x-system-id": "alok",
    },
  );
  // print(response.body);
  decodedResponse = jsonDecode(response.body);
  if (decodedResponse["status"] == "Success") {
    // print(decodedResponse.runtimeType);
    return decodedResponse["payments"];
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

DateTime timestampToDate(int timestamp) {
  return DateTime.fromMicrosecondsSinceEpoch(timestamp);
}

getPaymentRecords(var paymentRecords, String duration) async {
  final response = await listPaymentRecords();
  var noOfPayments = response.length;
  // DateTime now = DateTime.now();
  // DateTime date = new DateTime(now.year, now.month, now.day);
  for (var i = 0; i < noOfPayments; i++) {
    // if (duration == "Today") {
    //   if (timestampToDate(response[i]["settlementDatetime "]) == date) {
    //     paymentRecords.add(response[i]);
    //   }
    // } else if (duration == "3 days") {
    //   paymentRecords.add(response[i]);
    // } else if (duration == "1 week") {
    //   paymentRecords.add(response[i]);
    // }
    paymentRecords.add(response[i]);
  }
  return paymentRecords;
}
