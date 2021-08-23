import 'package:flutter/material.dart';

//ignore: must_be_immutable
class TextFieldWithHintText extends StatelessWidget {
  TextFieldWithHintText(
      {Key? key,
      required this.hint,
      required this.label,
      required this.validateText})
      : super(key: key);
  String label, hint;
  bool validateText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: '${label}',
          hintText: '${hint}',
          errorText: validateText ? '${label} can\'t be empty' : null,
        ),
      ),
    );
  }
}
