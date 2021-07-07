import 'package:flutter/material.dart';
import 'package:http_req/constants/strings.dart';

class Catalogue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalogue"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, FETCH_DATA),
              child: Text("Fetch Data"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, POST_DATA),
              child: Text("Post Data"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, LOCAL_STORAGE),
              child: Text("Local Storage"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, SECURE_STORAGE),
              child: Text("Secure Storage"),
            ),
          ],
        ),
      ),
    );
  }
}
