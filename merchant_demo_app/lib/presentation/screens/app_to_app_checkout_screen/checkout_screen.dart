import 'package:flutter/material.dart';
import 'package:merchant_demo_app/components/build_app_bar.dart';
import 'package:merchant_demo_app/components/my_bottom_nav_bar.dart';

import 'components/body.dart';

class AppToAppCheckoutScreen extends StatelessWidget {
  const AppToAppCheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
