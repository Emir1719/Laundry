import 'package:flutter/material.dart';
import 'package:laundry/widget/text_form_fields/text_form_field.dart';

class TextWashMode extends StatelessWidget {
  const TextWashMode({super.key, this.onChanged, this.validator, this.controller});
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      onChanged: (value) => onChanged!(value),
      validator: (value) => validator!(value),
      controller: controller,
      hintText: "Yıkama türünü giriniz",
      labelText: "Yıkama Türü",
      keyboardType: TextInputType.text,
    );
  }
}
