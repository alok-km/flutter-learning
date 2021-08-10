import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.decryptedUrl}) : super(key: key);
  final String decryptedUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(decryptedUrl),
    );
  }
}
