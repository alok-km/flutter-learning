import 'dart:async';
import 'package:flutter/material.dart';
import 'package:payment_demo_app/presentation/screens/wait_for_received_url/wait_for_retrieval.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 0), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => WaitForReceivedUrlScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("lib/assets/icons/payment-app-icon.png"),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
