import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant_demo_app/components/build_app_bar.dart';
import 'package:merchant_demo_app/components/drawer.dart';
import 'package:merchant_demo_app/components/my_bottom_nav_bar_home.dart';
import 'package:merchant_demo_app/controllers/cart_item_controller.dart';
import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CartItemController cartItemController = Get.put(CartItemController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: buildAppBar(),
        drawer: buildDrawer(context),
        body: Body(cartItemController: cartItemController),
        bottomNavigationBar:
            MyBottomNavBarHome(cartItemController: cartItemController),
      ),
    );
  }
}
