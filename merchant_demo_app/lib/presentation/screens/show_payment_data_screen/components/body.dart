import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
      child: ListView(
        children: [
          Row(
            children: [
              Icon(
                Icons.payment,
                color: Colors.green,
              ),
              SizedBox(width: 8),
              Text(
                "Payment Records",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Divider(height: 15, thickness: 2),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
