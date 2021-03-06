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
const PAYMENTSUCCESS = "/paymentSuccess";
const DISPLAYQR = "/displayQR";
const HOME = "/home";
const QRPAYMENT = "/qrPayment";

//URLs we use in our app
const generateTokenURL = "http://10.3.60.45:8123/generateAppToAppPaymentToken";
const retrieveTokenURLprefix =
    "http://10.3.60.45:8123/retrieveAppToAppPaymentToken/";
const encodeEmvQRCode = "http://10.3.60.45:5080/encodeEmvQRCode";
const listPaymentRecordsUrl = "http://10.3.60.45:8123/listPaymentResult";
const deviceRegistrationUrl = "http://10.3.60.45:8123/deviceRegistration";
const loginUrl = "http://10.3.60.45:8123/login";
const logoutUrl = "http://10.3.60.45:8123/logout";
