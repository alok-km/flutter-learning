import 'package:flutter/material.dart';
import 'package:payment_demo_app/models/retrieve_app_to_app_token.dart';
import 'package:payment_demo_app/presentation/screens/decrypt_received_url_screen/display_decrypted_received_url.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.receivedUrl}) : super(key: key);
  final String receivedUrl;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String decryptedUrl = "";
  getPayload() async {
    final response = await retrieveAppToAppToken(widget.receivedUrl);
    setState(() {
      decryptedUrl = response;
    });
    print(decryptedUrl);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(widget.receivedUrl),
          ElevatedButton(
            onPressed: () async {
              await getPayload();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DisplayDecryptedReceivedUrlScreen(
                      decryptedUrl: decryptedUrl),
                ),
              );
            },
            child: Text("Decrypt Received Url"),
          ),
        ],
      ),
    );
  }
}
