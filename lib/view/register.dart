import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/constant/image.dart';
import 'package:laundry/constant/route.dart';
import 'package:laundry/controller/auth_controller.dart';
import 'package:laundry/widget/auth_form.dart';
import 'package:laundry/widget/buttons/register_btn.dart';
import 'package:laundry/widget/text_form_fields/text_name.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    const space = 20.0;
    final image = AppImage.getInstance();

    return Scaffold(
      appBar: AppBar(title: const Text("Kayıt")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          image.logo,
          TextName(
            onChanged: (value) => controller.name.value = value,
          ),
          const SizedBox(height: space),
          AuthForm(formKey: controller.registerFormKey),
          const BtnRegister(),
          TextButton.icon(
            onPressed: () {
              Get.toNamed(AppRoute.login);
            },
            icon: const Icon(Icons.person),
            label: const Text("Hesabınız var mı? Giriş yapın"),
          ),
        ],
      ),
    );
  }
}
