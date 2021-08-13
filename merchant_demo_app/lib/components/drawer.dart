import 'package:flutter/material.dart';
import 'package:merchant_demo_app/presentation/screens/configuration_screen/configuration_screen.dart';

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
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
          title: const Text('Dummy Screen Title'),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {},
        ),
      ],
    ),
  );
}
