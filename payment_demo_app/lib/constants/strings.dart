import 'package:flutter/material.dart';

// Colors that we use in our app
const kPrimaryColor = Color(0xFF0C9869);
const kTextColor = Color(0xFF3C4046);
const kBackgroundColor = Color(0xFFF9F8FD);

//padding that we use in our app
const double kDefaultPadding = 20.0;

//constants for routing
const HOME = "/home";

//URLs we use in our app
const decodeEmvQRCodeUrl = "http://10.3.60.45:5080/decodeEmvQRCode";
const confirmPaymentUrl = "http://10.3.60.45:8123/paymentResultNotification";
