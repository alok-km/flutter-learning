import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant_demo_app/components/build_app_bar_with_drawer.dart';
import 'package:merchant_demo_app/components/drawer.dart';
import 'package:merchant_demo_app/presentation/screens/home/components/my_bottom_nav_bar_home.dart';
import 'package:merchant_demo_app/controllers/cart_item_controller.dart';
import 'package:merchant_demo_app/controllers/configuration_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CartItemController cartItemController = Get.put(CartItemController());
  final ConfigurationController configurationController =
      Get.put(ConfigurationController());

  getDataFromSharedPrefs() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? encodedPropertyDataFromSharedPrefs =
          prefs.getString("AppToApp_Request_Properties");
      List<dynamic> decodedPropertyDataFromSharedPrefs =
          json.decode(encodedPropertyDataFromSharedPrefs!);
      try {
        configurationController.properties[0] =
            decodedPropertyDataFromSharedPrefs[0];
        print(configurationController.properties[0]);
      } catch (err) {
        print("No ProxyID in Shared Preferences, error: $err.");
      }
      try {
        configurationController.properties[1] =
            decodedPropertyDataFromSharedPrefs[1];
        print(configurationController.properties[1]);
      } catch (err) {
        print("No ProxyIDType in Shared Preferences, error: $err.");
      }
      try {
        configurationController.properties[2] =
            decodedPropertyDataFromSharedPrefs[2];
        print(configurationController.properties[2]);
      } catch (err) {
        print("No EndToEndPrefix in Shared Preferences, error: $err.");
      }
    } catch (err) {
      print("No data in Shared Preferences, error: $err.");
    }
  }

  @override
  void initState() {
    getDataFromSharedPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: buildAppBarWithDrawer("Merchant App"),
        drawer: buildDrawer(context),
        body: Body(cartItemController: cartItemController),
        bottomNavigationBar:
            MyBottomNavBarHome(cartItemController: cartItemController),
      ),
    );
  }
}
