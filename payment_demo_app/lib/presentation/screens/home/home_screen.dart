import 'package:flutter/material.dart';
import 'package:payment_demo_app/components/build_app_bar.dart';
import 'package:payment_demo_app/services/share_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _receivedText = "";

  @override
  void initState() {
    super.initState();

    // Create the share service
    ShareService()
      // Register a callback so that we handle shared data if it arrives while the
      // app is running
      ..onDataReceived = _handleSharedData

      // Check to see if there is any shared data already, meaning that the app
      // was launched via sharing.
      ..getSharedData().then(_handleSharedData);
  }

  /// Handles any shared data we may receive.
  void _handleSharedData(String receivedData) {
    setState(() {
      _receivedText = receivedData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Text(_receivedText),
    );
  }
}
