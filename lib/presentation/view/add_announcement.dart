import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/presentation/controller/announcement_controller.dart';
import 'package:laundry/presentation/widget/text_form_fields/text_form_field.dart';

class AddAnnouncementView extends StatelessWidget {
  const AddAnnouncementView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AnnouncementController());
    const space = SizedBox(height: 20);

    return Scaffold(
      appBar: AppBar(title: const Text("Duyuru Ekle")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            AppTextField(
              onChanged: controller.setTitle,
              labelText: "Başlık",
              hintText: "Başlık Ekleyin",
            ),
            space,
            AppTextField(
              onChanged: controller.setContent,
              labelText: "İçerik",
              hintText: "İçerik Ekleyin",
              maxLines: 10,
              minLines: 5,
            ),
            space,
            ElevatedButton.icon(
              onPressed: controller.publish,
              icon: const Icon(Icons.send),
              label: const Text("Yayınla"),
            ),
          ],
        ),
      ),
    );
  }
}
