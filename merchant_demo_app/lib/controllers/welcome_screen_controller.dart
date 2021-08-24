import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreenX extends GetxController {
  //variables for create account
  var ecGatewayDevIDX = TextEditingController();
  var custIDX = TextEditingController();
  var merchantIDX = TextEditingController();
  var userIDX = TextEditingController();
  var pwdX = TextEditingController();
  var endToEndIDX = TextEditingController();
  final ecGatewayDevKey = GlobalKey<FormState>();
  final custIDKey = GlobalKey<FormState>();
  final merchantIDKey = GlobalKey<FormState>();
  final userIDKey = GlobalKey<FormState>();
  final pwdKey = GlobalKey<FormState>();
  final endToEndIDKey = GlobalKey<FormState>();
  bool ecGatewayDevFlag = false;
  bool custIDFlag = false;
  bool merchantIDFlag = false;
  bool userIDFlag = false;
  bool pwdFlag = false;
  bool endToEndIDFlag = false;

  //variables for login
  var deviceToken = 'null';
  var usernameX = TextEditingController();
  var userpwdX = TextEditingController();
  final usernameKey = GlobalKey<FormState>();
  final userpwdKey = GlobalKey<FormState>();
  bool usernameFlag = false;
  bool userpwdFlag = false;

  //variables for logout
  var loginToken = 'null';
}
