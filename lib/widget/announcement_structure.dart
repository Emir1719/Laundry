import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:laundry/constant/style.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/model/announcement.dart';
import 'package:laundry/widget/buttons/delete_announcement.dart';

class AnnouncementStructure extends StatelessWidget {
  const AnnouncementStructure({super.key, required this.announ});
  final Announcement announ;

  @override
  Widget build(BuildContext context) {
    final style = locator<AppStyle>();
    const space = SizedBox(height: 10);

    return Container(
      decoration: style.announcementContainer(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(announ.title, style: style.announcementTitle),
                space,
                Text(announ.content, style: style.announcementContent),
              ],
            ),
          ),
          space,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat('dd.MM.yyyy  -  HH:mm').format(announ.date),
                  style: style.announcementContent,
                ),
                BtnDeleteAnnouncement(announ: announ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
