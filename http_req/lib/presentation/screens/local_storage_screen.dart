import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageScreen extends StatefulWidget {
  const LocalStorageScreen({Key? key}) : super(key: key);

  @override
  _LocalStorageScreenState createState() => _LocalStorageScreenState();
}

class _LocalStorageScreenState extends State<LocalStorageScreen> {
  String? value = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Save/Load Data'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Data in the Shared Preferences:",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              value ?? "<No data>",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 32),
            Divider(),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString("TestString_Key", "My Value!");
              },
              child: Text("Save Data"),
            ),
            ElevatedButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                setState(() {
                  value = prefs.getString('TestString_Key');
                });
              },
              child: Text("Load Data"),
            ),
            ElevatedButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('TestString_Key');
              },
              child: Text("Delete Data"),
            ),
          ],
        ),
      ),
    );
  }
}
