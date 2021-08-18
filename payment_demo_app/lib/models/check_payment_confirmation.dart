import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/io_client.dart';
import 'package:payment_demo_app/constants/strings.dart';

Future checkPaymentConfirmation(
  String settlementCurrency,
  var settlementAmt,
  String clearingCode,
  String creditorAcctId,
  String creditorAcctIdType,
) async {
  final body = jsonEncode({
    "clientReqId": "2D4BF3A8C37E11EB88320242AC110009",
    "clientSysId": "boa",
    "clientUsrId": "root",
    "acctVerificationOption": "SKIP_PYE_VRF",
    "creditorAcctVrfDetail": {
      "accountStatus": "MACTHED",
      "amountStatus": "NOT_CHECKED",
      "currencyStatus": "UNMATCHED",
      "nameStatus": "UNDETERMINED",
      "proxyIdStatus": "UNDETERMINED",
      "overrideRequired": false
    },
    "credit": true,
    "debtorAcctIdType": "BBAN",
    "transactionStatus": "ACSC",
    "balanceStatus": "POSTED",
    "targetAcctNoType": "BBAN",
    "type": "CREDIT_TRANSFER",
    "businessService": "PAYC03",
    "outward": false,
    "onus": false,
    "recipientRealtime": false,
    "realtimeOut": true,
    "exceptionType": "NONE",
    "exceptionHandlingStatus": "NONE",
    "transactionId": "2D4BF3A8C37E11EB88320242AC110005",
    "fpsReferenceNo": "FRN20210602NpT8RIgXF",
    "endToEndId": "ecgatewaytest2",
    "categoryPurpose": "CXBSNS",
    "settlementAmt": settlementAmt,
    "settlementCurrency": "${settlementCurrency}",
    "settlementDate": [2021, 6, 2],
    "fpsCharge": {},
    "debtorName": "Ho Mai Li",
    "debtorAgent": "000",
    "debtorAcctId": "0878946223",
    "creditorName": "NA",
    "creditorAgent": "003",
    "creditorAcctId": "${creditorAcctId}",
    "creditorAcctIdType": "${creditorAcctIdType}",
    "creditorCustId": "vincenthung",
    "returnReasonInfo": [null, null],
    "settlementDatetime": 1622623234046,
    "statusReasonInfo": ["/FPSINF/VRF_STTL", null, null],
    "balanceReference": "A01ks5rkd39hdHXU",
    "clearingCode": "${clearingCode}",
    "targetAcctNo": "0878946223",
    "charge": 0.00,
    "creationDatetime": 1622623233000
  });
  bool trustSelfSigned = true;
  HttpClient httpClient = new HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => trustSelfSigned);
  IOClient ioClient = new IOClient(httpClient);
  final response = await ioClient.post(
    Uri.parse(checkPaymentConfirmationUrl),
    body: body,
    headers: {
      "Content-Type": "application/json",
      "x-system-id": "alok",
      "x-business-service-type": "PAYC03"
    },
  );
  Map<String, dynamic> decodedResponse = jsonDecode(response.body);
  print(decodedResponse);
  if (decodedResponse["status"] == "Success") {
    return decodedResponse;
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
