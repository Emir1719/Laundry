import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/presentation/controller/auth_controller.dart';
import 'package:laundry/presentation/widget/auth_form.dart';
import 'package:laundry/presentation/widget/buttons/any_have_account.dart';
import 'package:laundry/presentation/widget/buttons/register_btn.dart';
import 'package:laundry/presentation/widget/logo.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 20);
    Get.put(AuthController());

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
