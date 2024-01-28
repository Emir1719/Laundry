import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/constant/route.dart';
import 'package:laundry/constant/style.dart';
import 'package:laundry/controller/announcement_controller.dart';
import 'package:laundry/locator.dart';

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
        title: FutureBuilder(
          future: controller.getAllData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text("Hata: ${snapshot.error}");
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  controller.getFirstData().title,
                  style: style.announcementTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                space,
                Text(
                  controller.getFirstData().content,
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
