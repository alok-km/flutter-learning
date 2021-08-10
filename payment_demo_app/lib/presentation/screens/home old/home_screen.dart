import 'package:flutter/material.dart';
import 'package:payment_demo_app/components/build_app_bar.dart';
import 'package:payment_demo_app/services/share_service.dart';
import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _receivedUrl = "";

  @override
  void initState() {
    super.initState();

    // Create the share service
    ShareService()
      // Register a callback so that we handle shared data if it arrives while the
      // app is running
      ..onDataReceived = _handleReceivedData

      // Check to see if there is any shared data already, meaning that the app
      // was launched via sharing.
      ..getReceivedData().then(_handleReceivedData);
  }

  /// Handles any shared data we may receive.
  void _handleReceivedData(String receivedUrl) {
    setState(() {
      _receivedUrl = receivedUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(receivedUrl: _receivedUrl),
    );
  }
}
