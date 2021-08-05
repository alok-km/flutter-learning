import 'dart:convert';
import 'dart:io';
import 'package:http/io_client.dart';
import 'package:merchant_demo_app/constants/strings.dart';
import 'package:merchant_demo_app/controllers/cart_item_controller.dart';
import 'package:get/get.dart';

Future generateAppToAppToken(String refLabel) async {
  final CartItemController cartItemController = Get.find();
  final body = jsonEncode({
    "proxyId": "dev@iaspec.com",
    "proxyIdType": "EMAL",
    "merchantTimeout": 1665639120000,
    "transactionCcy": "HKD",
    "transactionAmount": "${cartItemController.total[0]}",
    "referenceLabel": "${refLabel}"
  });
  try {
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
    return decodedResponse['token'];
  } catch (err) {
    print(err);
  }
}
