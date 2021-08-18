import 'package:flutter/material.dart';
import 'package:merchant_demo_app/constants/strings.dart';
import 'package:merchant_demo_app/presentation/screens/configuration_screen/configuration_screen.dart';
import 'package:merchant_demo_app/presentation/screens/show_payment_data_screen/show_payment_data_screen.dart';

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: kPrimaryColor,
          ),
          child: Text('Configure the App'),
        ),
        ListTile(
          title: const Text('Configure'),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => ConfigurationScreen()));
          },
        ),
        ListTile(
          title: const Text('Payment Records'),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => ShowPaymentRecordsScreen()));
          },
        ),
      ],
    ),
  );
}
