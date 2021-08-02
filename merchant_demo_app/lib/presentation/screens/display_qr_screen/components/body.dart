import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

//ignore: must_be_immutable
class Body extends StatefulWidget {
  Body({
    Key? key,
    required this.rawQrData,
    required this.dropDownValue,
    required this.amountController,
  }) : super(key: key);
  String rawQrData;
  String dropDownValue;
  TextEditingController amountController;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: RepaintBoundary(
              key: key,
              child: Container(
                color: Colors.white,
                child: QrImage(
                  size: 300, //size of the QrImage widget.
                  data: widget.rawQrData, //textdata used to create QR code
                ),
              ),
            ),
          ),
          Container(
            child: Text(
              "Currency: ${widget.dropDownValue}",
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              child: Text(
                "Amount: \$${widget.amountController.text}",
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
