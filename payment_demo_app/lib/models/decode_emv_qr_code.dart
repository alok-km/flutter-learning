import 'dart:convert';
import 'dart:io';
import 'package:http/io_client.dart';
import 'package:payment_demo_app/constants/strings.dart';

Future decodeEmvQRCode(String rawQrData) async {
  final body = jsonEncode({
    "rawQrData": "${rawQrData}",
  });
  try {
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
    return decodedResponse["data"];
  } catch (err) {
    print(err);
  }
}
