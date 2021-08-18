import 'package:flutter/material.dart';
import 'package:merchant_demo_app/components/my_bottom_nav_bar.dart';

import 'components/body.dart';

class ConfigurationScreen extends StatelessWidget {
  const ConfigurationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
        ),
      ),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
