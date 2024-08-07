import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/config/route.dart';
import 'package:laundry/util/constant/style.dart';
import 'package:laundry/presentation/controller/announcement_controller.dart';
import 'package:laundry/config/locator.dart';
import 'package:laundry/domain/model/announcement.dart';

class ShortAnnouncement extends GetView<AnnouncementController> {
  const ShortAnnouncement({super.key});

  @override
  Widget build(BuildContext context) {
    final style = locator<AppStyle>();
    const space = SizedBox(height: 10);

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
            if (snapshot.data?.docs.isEmpty ?? snapshot.data == null) {
              return const Center(child: Text("Duyuru Yok"));
            }

            final ann = Announcement.fromMap(snapshot.data!.docs.first.data());

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ann.title,
                  style: style.announcementTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                space,
                Text(
                  ann.content,
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
