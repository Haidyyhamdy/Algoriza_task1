import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final String validate;
  final IconData? suffix;
  final TextInputType type;
  final Widget? prefix;
  final bool isPassword;

  const DefaultTextField({
    Key? key,
    required this.text,
    required this.controller,
    required this.validate,
    required this.type,
    this.suffix,
    this.prefix,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      validator: (value) {
        if (value!.isEmpty) {
          return validate;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(color: Colors.grey[400]),
        prefixIcon: prefix,
        suffixIcon: Icon(suffix),
        border: OutlineInputBorder(),
      ),
    );
  }
}
