import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AmountInputter extends StatelessWidget {
  const AmountInputter({
    Key? key,
    required this.amountController,
  }) : super(key: key);

  final TextEditingController amountController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Text(
            "Amount: ",
            style: Theme.of(context).textTheme.button,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 60),
          child: Container(
            // height: 20.0,
            width: 50,
            child: TextField(
              controller: amountController,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+.?\d{0,2}')),
              ], //to only allow 2 decimal places
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
                signed: false,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
