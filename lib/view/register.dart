import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/controller/auth_controller.dart';
import 'package:laundry/widget/auth_form.dart';
import 'package:laundry/widget/buttons/any_have_account.dart';
import 'package:laundry/widget/buttons/register_btn.dart';
import 'package:laundry/widget/logo.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    const space = SizedBox(height: 20);

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(title: const Text("Kayıt")),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const KoskLogo(),
            space,
            AuthForm(formKey: controller.registerFormKey),
            const BtnRegister(),
            const BtnAnyHaveAccount(),
          ],
        ),
      ),
    );
  }
}
