import 'dart:convert';
import 'dart:io';
import 'package:http/io_client.dart';
import 'package:merchant_demo_app/constants/strings.dart';

Future generateAppToAppToken() async {
  final body = jsonEncode({
    "proxyId": "dev@iaspec.com",
    "proxyIdType": "EMAL",
    "merchantTimeout": 1665639120000,
    "transactionCcy": "HKD",
    "transactionAmount": "6996",
    "referenceLabel": "moguts"
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
