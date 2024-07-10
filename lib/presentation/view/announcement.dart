import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/presentation/controller/announcement_controller.dart';
import 'package:laundry/config/locator.dart';
import 'package:laundry/domain/model/announcement.dart';
import 'package:laundry/domain/repository/database_repository.dart';
import 'package:laundry/presentation/widget/announcement_structure.dart';

class AnnouncementView extends StatelessWidget {
  const AnnouncementView({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = locator<DatabaseRepository>();

    return Scaffold(
      appBar: AppBar(title: const Text("Duyurular")),
      body: GetBuilder<AnnouncementController>(
        builder: (context) {
          return FutureBuilder(
            future: repository.getAnnouncements(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text("Hata: ${snapshot.error}");
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
