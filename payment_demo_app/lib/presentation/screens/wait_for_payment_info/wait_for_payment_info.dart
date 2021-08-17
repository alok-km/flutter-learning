import 'package:flutter/material.dart';

import 'components/body.dart';

class WaitForPaymentInfoScreen extends StatefulWidget {
  const WaitForPaymentInfoScreen({Key? key, required this.receivedUrl})
      : super(key: key);
  final String receivedUrl;
  @override
  _WaitForPaymentInfoScreenState createState() =>
      _WaitForPaymentInfoScreenState();
}

class _WaitForPaymentInfoScreenState extends State<WaitForPaymentInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(receivedUrl: widget.receivedUrl),
    );
  }
}
