import 'package:flutter/material.dart';
import 'package:laundry/widget/text_form_fields/text_form_field.dart';

class TextFileNo extends StatelessWidget {
  const TextFileNo({super.key, this.onChanged, this.validator});
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      onChanged: (value) => onChanged!(value),
      validator: (value) => validator!(value),
      hintText: "File numarasını giriniz",
      labelText: "File No",
      keyboardType: TextInputType.number,
    );
  }
}
