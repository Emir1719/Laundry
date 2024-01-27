import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/constant/style.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/view/announcement.dart';

class ShortAnnouncement extends StatelessWidget {
  const ShortAnnouncement({super.key});

  @override
  Widget build(BuildContext context) {
    final style = locator<AppStyle>();
    const space = SizedBox(height: 10);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: style.shortAnnouncementContainer(),
      child: GestureDetector(
        onTap: () {
          Get.to(() => const AnnouncementView());
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Önemli bir duyuru",
              style: style.announcementTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            space,
            Text(
              "Duyurunun içeriği...",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: style.announcementContent,
            ),
          ],
        ),
      ),
    );
  }
}
