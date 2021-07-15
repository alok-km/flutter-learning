import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:merchant_demo_app/constants/strings.dart';

import 'components/body.dart';
import 'components/my_bottom_nav_bar.dart';

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

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset("lib/assets/icons/menu.svg"),
      ),
    );
  }
}
