import 'package:flutter/material.dart';

//ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    Key? key,
    required this.hint,
    required this.label,
    required this.formKey,
    required this.controller,
    required this.obscureText,
  }) : super(key: key);
  String label, hint;
  GlobalKey<FormState> formKey;
  TextEditingController controller;
  bool obscureText;

  @override
  CustomTextFormFieldState createState() {
    return CustomTextFormFieldState();
  }
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: TextFormField(
          obscureText: widget.obscureText,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '${widget.label}',
              hintText: '${widget.hint}',
              suffixIcon: IconButton(
                onPressed: widget.controller.clear,
                icon: Icon(Icons.clear),
              )),
          controller: widget.controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "${widget.label} can't be null";
            }
            return null;
          },
        ),
      ),
    );
  }
}
