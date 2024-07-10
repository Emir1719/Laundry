import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/config/route.dart';
import 'package:laundry/util/constant/style.dart';
import 'package:laundry/presentation/controller/announcement_controller.dart';
import 'package:laundry/config/locator.dart';
import 'package:laundry/domain/model/announcement.dart';

class ShortAnnouncement extends StatelessWidget {
  const ShortAnnouncement({super.key});

  @override
  Widget build(BuildContext context) {
    final style = locator<AppStyle>();
    const space = SizedBox(height: 10);
    final controller = Get.put(AnnouncementController());

    return Container(
      decoration: style.shortAnnouncementContainer(),
      margin: const EdgeInsets.symmetric(horizontal: 20) + const EdgeInsets.only(top: 20),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        onTap: () => Get.toNamed(AppRoute.announcement),
        title: StreamBuilder(
          stream: controller.repository.getAnnouncementsStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text("Hata: ${snapshot.error}");
            }
            if (snapshot.data!.docs.isEmpty) {
              return const Center(child: Text("Duyuru Yok"));
            }
            List<Announcement> announcements = [];
            for (var doc in snapshot.data!.docs) {
              announcements.add(Announcement.fromMap(doc.data()));
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  announcements.first.title,
                  style: style.announcementTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                space,
                Text(
                  announcements.first.content,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: style.announcementContent,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
