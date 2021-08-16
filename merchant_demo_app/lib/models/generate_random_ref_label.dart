import 'dart:math';

import 'package:get/get.dart';
import 'package:merchant_demo_app/controllers/configuration_controller.dart';

ConfigurationController configurationController = Get.find();
var RANDOM = Random.secure();

String getRandString(int len) {
  var randomString = List<String>.generate(len, (i) => getRandomChar());
  return randomString.join();
  //return base64UrlEncode(randomString);
}

String getRandomChar() {
  int type = RANDOM.nextInt(3);
  switch (type) {
    case 0:
      return RANDOM.nextInt(10).toString();
    case 1:
      return (RANDOM.nextInt(26) + 10).toRadixString(36);
    case 2:
      return (RANDOM.nextInt(26) + 10).toRadixString(36).toUpperCase();
  }
  return RANDOM.nextInt(10).toString();
}

String baseConverter(String string) {
  int parsedString = int.parse(string);
  var convertedString = parsedString.toRadixString(36);
  return convertedString;
}

String generateRefLabel() {
  final DateTime now = DateTime.now();
  String timestamp = now.millisecondsSinceEpoch.toString();
  print(timestamp);
  timestamp = baseConverter(timestamp);
  print(timestamp);
  String randomString = getRandString(5);
  print(randomString);
  return configurationController.properties[2] + timestamp + randomString;
}
