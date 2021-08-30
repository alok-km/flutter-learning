import 'package:flutter/material.dart';
import 'package:merchant_demo_app/components/build_app_bar_with_back_button.dart';
import 'package:merchant_demo_app/components/my_bottom_nav_bar.dart';

import 'components/body.dart';

class AppToAppCheckoutScreen extends StatelessWidget {
  const AppToAppCheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWithBackButton("App To App Payment"),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
