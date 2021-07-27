import 'package:flutter/material.dart';

//ignore: must_be_immutable
class DropDownButton extends StatefulWidget {
  DropDownButton({
    Key? key,
    required this.dropDownValue,
  }) : super(key: key);
  String dropDownValue = '';
  var items = ["HKD", "USD", "RMB", "EUR"];
  @override
  _DropDownButtonState createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: widget.dropDownValue,
      icon: Icon(Icons.keyboard_arrow_down),
      items: widget.items.map((String items) {
        return DropdownMenuItem(value: items, child: Text(items));
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          widget.dropDownValue = newValue!;
        });
      },
    );
  }
}
