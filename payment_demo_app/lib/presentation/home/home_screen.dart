import 'package:flutter/material.dart';
import 'package:payment_demo_app/components/build_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Text("Hey..."),
    );
  }
}
