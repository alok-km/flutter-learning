import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Shop"),
        backgroundColor: Colors.grey[200],
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "test"),
              child: Text("Fetch Data"),
            ),
          ],
        ),
      ),
    );
  }
}
