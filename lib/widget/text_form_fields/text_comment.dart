import 'package:flutter/material.dart';
import 'package:laundry/widget/text_form_fields/text_form_field.dart';

class TextComment extends StatelessWidget {
  const TextComment({super.key, this.onChanged, this.validator});
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      onChanged: (value) => onChanged!(value),
      validator: (value) => validator!(value),
      hintText: "Açıklama giriniz",
      labelText: "Bilgilendirme Notu",
      minLines: 3,
      maxLines: 6,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.text,
    );
  }
}
