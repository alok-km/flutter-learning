import 'dart:convert';
import 'dart:io';
import 'package:http/io_client.dart';
import 'package:merchant_demo_app/constants/strings.dart';

Future generateRawQrData(String currency, String price) async {
  final body = jsonEncode({
    "poiMethod": "DYNAMIC",
    "trxCurrency": "${currency}",
    "trxAmt": "${price}",
    "referenceLabel": "moguts",
    "clearingCode": "004",
    "proxyId": "dev@iaspec.com",
    "proxyIdType": "EMAIL_ADDRESS",
    "merchantTimeout": 1665639120000,
    "editableTrxAmtIndicator": false
  });
  try {
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
    Map<String, dynamic> decodedResponse = jsonDecode(response.body);
    //print(decodedResponse);
    return decodedResponse['data']['rawQrData'];
  } catch (err) {
    print(err);
  }
}