import 'package:flutter/material.dart';

class PageWrapper extends StatelessWidget {
  final Widget page;

  PageWrapper(this.page);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page,
    );
  }
}
