import 'dart:io';
import 'package:http/io_client.dart';

void retrieveAppToAppToken(String retrieveURL) async {
  try {
    bool trustSelfSigned = true;
    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);
    final response = await ioClient.get(
      Uri.parse(retrieveURL),
    );
    print(response.body);
  } catch (err) {
    print(err);
  }
}
