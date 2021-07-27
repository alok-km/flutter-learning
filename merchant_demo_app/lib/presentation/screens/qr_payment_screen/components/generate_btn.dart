import 'package:flutter/material.dart';
import 'package:merchant_demo_app/constants/strings.dart';

class GenerateBtn extends StatelessWidget {
  const GenerateBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 100,
            right: 100,
          ),
          child: ConstrainedBox(
            constraints:
                BoxConstraints.tightFor(width: double.infinity, height: 40),
            child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, DISPLAYQR),
              child: Text(
                "Generate",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
