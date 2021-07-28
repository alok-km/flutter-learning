import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/counterController.dart';

class HomeScreen extends StatelessWidget {
  final CounterController counterController = Get.put(CounterController());
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Clicks: ${counterController.counter.value}")],
      ),
    );
  }
}
