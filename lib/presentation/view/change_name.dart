import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/presentation/controller/setting.dart';
import 'package:laundry/presentation/widget/buttons/update.dart';
import 'package:laundry/presentation/widget/text_form_fields/text_name.dart';

class ChangeNameView extends StatelessWidget {
  const ChangeNameView({super.key});

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 20);
    final cont = Get.put(SettingController());

    return Scaffold(
      appBar: AppBar(title: const Text("Ayarlar - İsim Değiştirme")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextName(
              controller: cont.name,
              onChanged: (value) => "",
            ),
            space,
            const BtnUpdate(),
          ],
        ),
      ),
    );
  }
}
