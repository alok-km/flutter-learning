import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/io_client.dart';

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
    return decodedResponse["payload"];
  } catch (err) {
    Fluttertoast.showToast(
      msg: "There was a problem while calling the API",
      toastLength: Toast.LENGTH_LONG,
    );
    print(err);
  }
}
