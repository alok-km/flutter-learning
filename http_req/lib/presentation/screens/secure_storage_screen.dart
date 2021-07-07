import 'package:flutter/material.dart';
import 'package:http_req/services/storage.dart';

class SecureStorageScreen extends StatefulWidget {
  const SecureStorageScreen({Key? key}) : super(key: key);

  @override
  _SecureStorageScreenState createState() => _SecureStorageScreenState();
}

class _SecureStorageScreenState extends State<SecureStorageScreen> {
  @override
  Widget build(BuildContext context) {
    String? userName;
    String? password;

    final SecureStorage secureStorage = SecureStorage();

    return Scaffold(
      appBar: AppBar(
        title: Text('Secure Storage'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Storing Data Securely",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(height: 32),
            Divider(),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                secureStorage.writeSecureData('username', 'alokmanav');
                secureStorage.writeSecureData('password', '12345678');
              },
              child: Text("Save Data"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Load Data"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Delete Data"),
            ),
          ],
        ),
      ),
    );
  }
}
