import 'package:flutter/material.dart';

// Colors that we use in our app
const kPrimaryColor = Color(0xFF0C9869);
const kTextColor = Color(0xFF3C4046);
const kBackgroundColor = Color(0xFFF9F8FD);

//padding that we use in our app
const double kDefaultPadding = 20.0;

//constants for routing
const CHECKOUT = "/checkout";
const PAYLOAD = "/payload";
const SUCCESS = "/success";

//URLs we use in our app
const generateTokenURL = "https://10.3.60.45:8081/initiateAppToAppPaymentToken";
const retrieveTokenURLprefix =
    "https://10.3.60.45:8081/retrieveAppToAppPaymentToken/";
