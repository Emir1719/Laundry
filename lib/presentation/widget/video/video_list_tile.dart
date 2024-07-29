import 'package:flutter/material.dart';
import 'package:laundry/domain/model/video.dart';
import 'package:laundry/util/constant/app_message.dart';
import 'package:laundry/util/constant/style.dart';
import 'package:laundry/util/extensions/video_url_launch.dart';

class VideoListTile extends StatelessWidget {
  const VideoListTile({super.key, required this.video});
  final Video video;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          await video.launch();
        } catch (e) {
          AppMessage.show(title: "Hata", message: e.toString(), type: Type.error);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: AppStyle().announcementContainer(),
        child: ListTile(
          leading: const Icon(
            Icons.play_circle_fill_rounded,
            color: Colors.blue,
            size: 32,
          ),
          title: Text(video.title.trim()),
        ),
      ),
    );
  }
}
