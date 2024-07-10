import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/presentation/controller/user_controller.dart';
import 'package:laundry/util/constant/app_message.dart';
import 'package:laundry/presentation/controller/announcement_controller.dart';
import 'package:laundry/config/locator.dart';
import 'package:laundry/domain/model/announcement.dart';
import 'package:laundry/domain/repository/database_repository.dart';

class BtnDeleteAnnouncement extends StatelessWidget {
  const BtnDeleteAnnouncement({super.key, required this.announ});
  final Announcement announ;

  @override
  Widget build(BuildContext context) {
    final repository = locator<DatabaseRepository>();
    final controller = Get.put(AnnouncementController());
    final cont = UserController.call;

    if (cont.user == null) {
      return const SizedBox();
    }

    return cont.user!.isAdmin
        ? TextButton.icon(
            onPressed: () {
              AppMessage.showAlertDialog(
                context: context,
                title: "Silmek istediğinize emin misiniz?",
                message: "Duyuru kalıcı olarak silinecek",
                onSuccess: () {
                  repository.deleteAnnouncement(announ.id);
                  controller.update();
                },
              );
            },
            icon: const Icon(Icons.delete),
            label: const Text("Sil"),
          )
        : const SizedBox();
  }
}
