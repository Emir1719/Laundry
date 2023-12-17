import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/controller/auth_controller.dart';
import 'package:laundry/widget/text_mail.dart';
import 'package:laundry/widget/text_password.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({super.key, required this.formKey});
  final Key? formKey;

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    const space = 20.0;

    return Form(
      key: formKey,
      child: Column(
        children: [
          TextMail(
            onChanged: (value) => authController.email.value = value,
            validator: (value) => authController.emailValidator(value),
          ),
          const SizedBox(height: space),
          TextPassword(
            onChanged: (value) => authController.password.value = value,
            validator: (value) => authController.passwordValidator(value),
          ),
        ],
      ),
    );
  }
}
