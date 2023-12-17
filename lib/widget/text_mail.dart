import 'package:flutter/material.dart';
import 'package:laundry/widget/text_form_field.dart';

class TextMail extends StatelessWidget {
  const TextMail({super.key, this.onChanged, this.validator});
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      onChanged: (value) => onChanged!(value),
      validator: (value) => validator!(value),
      hintText: "Mail giriniz",
      labelText: "Mail",
      keyboardType: TextInputType.emailAddress,
    );
  }
}
