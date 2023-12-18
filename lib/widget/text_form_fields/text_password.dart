import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/controller/password_controller.dart';
import 'package:laundry/widget/text_form_fields/text_form_field.dart';

class TextPassword extends StatelessWidget {
  const TextPassword({super.key, this.onChanged, this.validator});
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PasswordController());

    return Obx(
      () => AppTextField(
        onChanged: (value) => onChanged!(value),
        validator: (value) => validator!(value),
        hintText: "Şifre giriniz",
        labelText: "Şifre",
        obscureText: controller.obscure.value,
        suffixIcon: IconButton(
          onPressed: controller.toggle,
          icon: controller.obscure.value ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
        ),
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
