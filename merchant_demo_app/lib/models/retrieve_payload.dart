import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'package:merchant_demo_app/constants/strings.dart';
import 'package:merchant_demo_app/models/launch_android_intent.dart';

//ignore: must_be_immutable
class RetrievePayload extends StatefulWidget {
  RetrievePayload({Key? key, required this.token}) : super(key: key);
  String token;

  @override
  _RetrievePayloadState createState() => _RetrievePayloadState(token);
}

class _RetrievePayloadState extends State<RetrievePayload> {
  String token;
  String payload = "";
  _RetrievePayloadState(this.token);
  Future retrieveAppToAppToken(String retrieveURL) async {
    try {
      bool trustSelfSigned = true;
      HttpClient httpClient = new HttpClient()
        ..badCertificateCallback =
            ((X509Certificate cert, String host, int port) => trustSelfSigned);
      IOClient ioClient = new IOClient(httpClient);
      final response = await ioClient.get(
        Uri.parse(retrieveURL),
      );
      Map<String, dynamic> decodedResponse = jsonDecode(response.body);
      return decodedResponse['payload'];
    } catch (err) {
      print(err);
    }
  }

  getPayload() async {
    final payloadResult =
        await retrieveAppToAppToken(retrieveTokenURLprefix + token);
    setState(() {
      payload = payloadResult;
    });
    launchAndroidIntent(payload);
  }

  @override
  void initState() {
    super.initState();
    getPayload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
