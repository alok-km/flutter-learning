import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RepaintBoundary(
          key: key,
          child: Container(
            color: Colors.white,
            child: QrImage(
              size: 300, //size of the QrImage widget.
              data: rawQrData, //textdata used to create QR code
            ),
          ),
        ),
      ],
    );
  }
}
