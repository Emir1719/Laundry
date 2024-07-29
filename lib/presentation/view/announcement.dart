import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/presentation/controller/announcement_controller.dart';
import 'package:laundry/config/locator.dart';
import 'package:laundry/domain/model/announcement.dart';
import 'package:laundry/domain/repository/database_repository.dart';
import 'package:laundry/presentation/widget/announcement_structure.dart';
import 'package:laundry/util/constant/app_message.dart';

class AnnouncementView extends StatelessWidget {
  const AnnouncementView({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = locator<DatabaseRepository>();

    return Scaffold(
      appBar: AppBar(title: const Text("Duyurular")),
      body: GetBuilder<AnnouncementController>(
        builder: (controller) {
          return FutureBuilder(
            future: repository.getAnnouncements(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                AppMessage.show(title: "Hata", message: snapshot.error.toString(), type: Type.error);
                return const SizedBox();
              }

              return ListView.separated(
                itemCount: snapshot.data!.length,
                padding: const EdgeInsets.all(20),
                separatorBuilder: (context, index) => const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  Announcement announ = snapshot.data![index];
                  return AnnouncementStructure(announ: announ);
                },
              );
            },
          );
        },
      ),
    );
  }
}
