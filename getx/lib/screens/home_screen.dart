import 'package:flutter/material.dart';
import 'package:getx/screens/wish_list_screen.dart';
import 'package:getx/state/products.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final Products _p = Get.put(Products());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WishList'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          InkWell(
            child: Container(
              width: 300,
              height: 80,
              color: Colors.red,
              alignment: Alignment.center,
              child: Obx(
                () => Text(
                  "Wish List ${_p.wishListItems.length}",
                  style: TextStyle(fontSize: 28, color: Colors.white),
                ),
              ),
            ),
            onTap: () => Get.to(WishListScreen()),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final product = _p.items[index];
                return Card(
                  key: ValueKey(product.id),
                  margin: EdgeInsets.all(5),
                  color: Colors.amberAccent,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
