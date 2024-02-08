import 'package:flutter/material.dart';
import 'package:laundry/widget/text_form_fields/text_form_field.dart';

class TextMail extends StatelessWidget {
  const TextMail({super.key, this.onChanged, this.validator, this.controller});
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      onChanged: (value) => onChanged!(value),
      validator: (value) => validator!(value),
      hintText: "Mail giriniz",
      labelText: "Mail",
      keyboardType: TextInputType.emailAddress,
    );
  }
}
