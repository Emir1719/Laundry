// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:laundry/widget/text_form_fields/text_form_field.dart';

class TextComment extends StatelessWidget {
  const TextComment({super.key, this.onChanged, this.validator, this.controller});
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      onChanged: (value) => onChanged!(value),
      validator: (value) => validator!(value),
      controller: controller,
      hintText: "Açıklama giriniz",
      labelText: "Bilgilendirme Notu",
      minLines: 3,
      maxLines: 6,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.text,
    );
  }
}
