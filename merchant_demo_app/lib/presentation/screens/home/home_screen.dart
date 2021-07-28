import 'package:flutter/material.dart';
import 'package:merchant_demo_app/components/build_app_bar.dart';

import 'components/body.dart';
import '../../../components/my_bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
