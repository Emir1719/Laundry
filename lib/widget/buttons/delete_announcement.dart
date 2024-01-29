import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/controller/announcement_controller.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/model/announcement.dart';
import 'package:laundry/service/database_repository.dart';

class BtnDeleteAnnouncement extends StatelessWidget {
  const BtnDeleteAnnouncement({super.key, required this.announ});
  final Announcement announ;

  @override
  Widget build(BuildContext context) {
    final repository = locator<DatabaseRepository>();
    final controller = Get.put(AnnouncementController());

    return FutureBuilder(
      future: repository.currentUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox();
        }
        if (snapshot.data!.isAdmin) {
          return TextButton.icon(
            onPressed: () {
              repository.deleteAnnouncement(announ.id);
              controller.update();
            },
            icon: const Icon(Icons.delete),
            label: const Text("Sil"),
          );
        }
        return const SizedBox();
      },
    );
  }
}
