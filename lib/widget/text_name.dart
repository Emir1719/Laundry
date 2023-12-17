import 'package:flutter/material.dart';
import 'package:laundry/widget/text_form_field.dart';

class TextName extends StatelessWidget {
  const TextName({super.key, this.onChanged, this.validator});
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      onChanged: (value) => onChanged!(value),
      validator: (value) => validator!(value),
      hintText: "Ad soyad giriniz",
      labelText: "Ad soyad",
      keyboardType: TextInputType.text,
    );
  }
}
