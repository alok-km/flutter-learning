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
    String _text1 = 'empty';
    String _text2 = 'empty';

    final SecureStorage secureStorage = SecureStorage();

    Future _save() async {
      secureStorage.writeSecureData('username', 'alokmanav');
      secureStorage.writeSecureData('password', '12345678');
    }

    Future _read() async {
      _text1 = await secureStorage.readSecureData('username');
      _text2 = await secureStorage.readSecureData('password');
    }

    Future _delete() async {
      secureStorage.deleteSecureData('username');
    }

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
            Text(_text1),
            Text(_text2),
            SizedBox(height: 32),
            Divider(),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: _save,
              child: Text("Save Data"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _read();
                });
              },
              child: Text("Load Data"),
            ),
            ElevatedButton(
              onPressed: _delete,
              child: Text("Delete Data"),
            ),
          ],
        ),
      ),
    );
  }
}
