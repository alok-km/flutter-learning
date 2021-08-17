import 'package:flutter/material.dart';
import 'package:payment_demo_app/presentation/screens/wait_for_payment_info/wait_for_payment_info.dart';
import 'package:payment_demo_app/services/share_service.dart';

class WaitForReceivedUrlScreen extends StatefulWidget {
  const WaitForReceivedUrlScreen({Key? key}) : super(key: key);

  @override
  _WaitForReceivedUrlScreenState createState() =>
      _WaitForReceivedUrlScreenState();
}

class _WaitForReceivedUrlScreenState extends State<WaitForReceivedUrlScreen> {
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
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            WaitForPaymentInfoScreen(receivedUrl: _receivedUrl),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
