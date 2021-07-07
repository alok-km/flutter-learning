import 'package:flutter/material.dart';
import 'package:http_req/models/post_data.dart';

class PostDataScreen extends StatefulWidget {
  const PostDataScreen({Key? key}) : super(key: key);

  @override
  _PostDataScreenState createState() => _PostDataScreenState();
}

class _PostDataScreenState extends State<PostDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Data"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: postData,
          child: Text("Send Post"),
        ),
      ),
    );
  }
}
