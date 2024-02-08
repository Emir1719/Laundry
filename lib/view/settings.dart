import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/controller/setting.dart';
import 'package:laundry/widget/buttons/sign_out.dart';
import 'package:laundry/widget/buttons/update.dart';
import 'package:laundry/widget/text_form_fields/text_mail.dart';
import 'package:laundry/widget/text_form_fields/text_name.dart';
import 'package:laundry/widget/text_form_fields/text_password.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 20);
    final cont = Get.put(SettingController());

    return Scaffold(
      appBar: AppBar(title: const Text("Ayarlar"), actions: const [BtnSignOut()]),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextName(
              controller: cont.name,
              onChanged: (value) => "",
            ),
            space,
            TextMail(
              controller: cont.mail,
              onChanged: (value) => "",
            ),
            space,
            TextPassword(
              controllerr: cont.password,
              onChanged: (value) => "",
            ),
            space,
            TextPassword(
              label: "Yeni Şifre",
              controllerr: cont.password,
              onChanged: (value) => "",
            ),
            space,
            const Text("İsim güncellemek için şifre girmenize gerek yoktur. Mail ve şifre değiştirmek için gerekli."),
            space,
            const BtnUpdate(),
          ],
        ),
      ),
    );
  }
}
