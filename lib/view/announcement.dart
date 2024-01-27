import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:laundry/constant/style.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/widget/buttons/delete_announcement.dart';

class AnnouncementView extends StatelessWidget {
  const AnnouncementView({super.key});

  @override
  Widget build(BuildContext context) {
    final style = locator<AppStyle>();
    const space = SizedBox(height: 10);

    return Scaffold(
      appBar: AppBar(title: const Text("Duyurular")),
      body: ListView.separated(
        itemCount: 4,
        padding: const EdgeInsets.all(20),
        separatorBuilder: (context, index) => const Divider(height: 40),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Önemli bir duyuru", style: style.announcementTitle),
              space,
              Text("Duyurunun içeriği " * 20, style: style.announcementContent),
              space,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat('dd.MM.yyyy  -  HH:mm').format(DateTime.now()),
                    style: style.announcementContent,
                  ),
                  const BtnDeleteAnnouncement(),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
