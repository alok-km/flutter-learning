import 'package:flutter/material.dart';
import 'package:merchant_demo_app/constants/strings.dart';
import 'package:merchant_demo_app/presentation/screens/home/components/header_with_searchbox.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final key = GlobalKey();
  String textdata = 'sample232132';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        HeaderWithSearchBox(size: size),
        SizedBox(height: kDefaultPadding),
        RepaintBoundary(
          key: key,
          child: Container(
            color: Colors.white,
            child: QrImage(
              size: 300, //size of the QrImage widget.
              data: textdata, //textdata used to create QR code
            ),
          ),
        ),
      ],
    );
  }
}
