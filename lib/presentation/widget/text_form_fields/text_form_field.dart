// ignore_for_file: avoid_init_to_null
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.onChanged,
    this.validator,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.keyboardType,
    this.prefixIcon = null,
    this.suffixIcon = null,
    this.hintText,
    this.labelText,
    this.minLines = 1,
    this.maxLines = 1,
    this.controller,
  });
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon, suffixIcon;
  final String? hintText, labelText;
  final int? minLines, maxLines;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: (value) => onChanged!(value),
      validator: (value) => validator!(value),
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 15),
        border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        prefixIcon: prefixIcon,
        hintText: hintText,
        labelText: labelText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
