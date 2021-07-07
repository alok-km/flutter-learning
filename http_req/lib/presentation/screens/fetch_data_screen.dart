import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http_req/constants/strings.dart';

class FetchDataScreen extends StatefulWidget {
  const FetchDataScreen({Key? key}) : super(key: key);

  @override
  _FetchDataScreenState createState() => _FetchDataScreenState();
}

class _FetchDataScreenState extends State<FetchDataScreen> {
  var _postsJson = [];

  void fetchPosts() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _postsJson = jsonData;
      });
    } catch (err) {}
  }

  @override
  void initState() {
    //implement initState
    super.initState();
    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetching data..."),
      ),
      body: ListView.builder(
        itemCount: _postsJson.length,
        itemBuilder: (context, i) {
          final post = _postsJson[i];
          return Text("Title: ${post["title"]}\nBody: ${post["body"]}\n\n");
        },
      ),
    );
  }
}
