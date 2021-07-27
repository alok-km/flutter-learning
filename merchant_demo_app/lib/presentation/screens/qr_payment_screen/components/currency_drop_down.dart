import 'package:flutter/material.dart';
import 'drop_down_button.dart';

class CurrencyDropDown extends StatelessWidget {
  const CurrencyDropDown({
    Key? key,
    required this.dropDownValue,
  }) : super(key: key);

  final String dropDownValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Text(
            "Currency: ",
            style: Theme.of(context).textTheme.button,
          ),
        ),
        DropDownButton(
          dropDownValue: dropDownValue,
        ),
      ],
    );
  }
}
