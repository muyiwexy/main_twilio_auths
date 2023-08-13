import 'package:flutter/material.dart';

class ReusableTextFormField extends StatelessWidget {
  const ReusableTextFormField(
      {super.key,
      required this.controller,
      required this.validator,
      required this.textType});
  final TextEditingController controller;
  final TextInputType textType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textType,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
      ),
      validator: validator,
    );
  }
}
