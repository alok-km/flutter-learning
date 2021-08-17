import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Row buildConfigureScreenSwitchRow(String title, bool isActive) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey[600]),
      ),
      Transform.scale(
        scale: 0.7,
        child: CupertinoSwitch(
          value: isActive,
          onChanged: (bool val) {},
        ),
      )
    ],
  );
}
