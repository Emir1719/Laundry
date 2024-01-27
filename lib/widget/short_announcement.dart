import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/constant/route.dart';
import 'package:laundry/constant/style.dart';
import 'package:laundry/locator.dart';

class ShortAnnouncement extends StatelessWidget {
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
        style: ListTileStyle.list,
        onTap: () => Get.toNamed(AppRoute.announcement),
        title: Column(
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
