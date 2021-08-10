import 'package:flutter/material.dart';
import 'package:payment_demo_app/components/build_app_bar.dart';

import 'components/body.dart';

class DisplayDecryptedReceivedUrlScreen extends StatelessWidget {
  const DisplayDecryptedReceivedUrlScreen(
      {Key? key, required this.decryptedUrl})
      : super(key: key);
  final String decryptedUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(decryptedUrl: decryptedUrl),
    );
  }
}
