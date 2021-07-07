import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hello'),
        ),
        body: Text('This is some text. Welcome to my app!'));
  }
}
