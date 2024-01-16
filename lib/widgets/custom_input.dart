import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    required this.icon,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.maxLength,
  });

  final String? labelText;
  final String? hintText;
  final IconData icon;
  final TextInputType? keyboardType;
  final Function(String?)? validator;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // otros casos dependiendo del uso
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText, // dinamico
        hintText: hintText, // dinamico
        prefixIcon: Icon(icon, color: Colors.yellow), // dinamico
      ),
      keyboardType: keyboardType, // dinamico
      validator: (value) => validator?.call(value), // dinamico
      onChanged: onChanged,
      onSaved: onSaved,
      maxLength: maxLength,
    );
  }
}
