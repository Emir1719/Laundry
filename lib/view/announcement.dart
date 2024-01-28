import 'package:flutter/material.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/model/announcement.dart';
import 'package:laundry/service/database_repository.dart';
import 'package:laundry/widget/announcement_structure.dart';

class AnnouncementView extends StatelessWidget {
  const AnnouncementView({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = locator<DatabaseRepository>();

    return Scaffold(
      appBar: AppBar(title: const Text("Duyurular")),
      body: FutureBuilder(
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
            separatorBuilder: (context, index) => const Divider(height: 40),
            itemBuilder: (context, index) {
              Announcement announ = snapshot.data![index];
              return AnnouncementStructure(announ: announ);
            },
          );
        },
      ),
    );
  }
}
