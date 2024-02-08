import 'package:flutter/material.dart';
import 'package:laundry/widget/text_form_fields/text_form_field.dart';

class TextName extends StatelessWidget {
  const TextName({super.key, this.onChanged, this.validator, this.controller});
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      onChanged: (value) => onChanged!(value),
      validator: (value) => validator!(value),
      hintText: "Ad soyad giriniz",
      labelText: "Ad soyad",
      keyboardType: TextInputType.text,
    );
  }
}
