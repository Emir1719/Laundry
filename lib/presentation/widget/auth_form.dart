import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/presentation/controller/auth_controller.dart';
import 'package:laundry/util/validator.dart';
import 'package:laundry/presentation/widget/text_form_fields/text_mail.dart';
import 'package:laundry/presentation/widget/text_form_fields/text_name.dart';
import 'package:laundry/presentation/widget/text_form_fields/text_password.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({super.key, required this.formKey});
  final Key? formKey;

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    const space = SizedBox(height: 20);
    final val = AppValidator();

    return Form(
      key: formKey,
      child: Column(
        children: [
          formKey == authController.registerFormKey
              ? TextName(
                  onChanged: (value) => authController.name.value = value,
                  validator: (value) => val.isNull(value),
                )
              : const SizedBox(),
          space,
          TextMail(
            onChanged: (value) => authController.email.value = value,
            validator: (value) => val.isEmail(value),
          ),
          space,
          TextPassword(
            onChanged: (value) => authController.password.value = value,
            validator: (value) => val.isPassword(value),
          ),
          space,
        ],
      ),
    );
  }
}
